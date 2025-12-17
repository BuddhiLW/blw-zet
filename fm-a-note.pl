#!/usr/bin/env perl

use strict;
use warnings;
use File::Path qw(make_path);
use File::Temp qw(tempfile);
use IPC::Open3;

# Configuration
my $tsv_file       = './dex/nodes.tsv';
my $images_dir     = './images';
my $log_file       = './unprocessed_files.log';
my $timeout        = 30;

# Ensure the images directory exists
make_path($images_dir);

# Clear the log file
open(my $log_fh, '>', $log_file) or die "Cannot open $log_file: $!";

# Check for arguments
if (@ARGV != 1) {
    die "Usage: $0 <note_id>\n";
}
my $id = $ARGV[0];

# Directory and README.md
my $dir = "$id/";
my $readme = "${dir}README.md";

# Skip if README.md does not exist
unless (-f $readme) {
    print "[SKIP] No README.md found for $dir\n";
    exit 0;
}

# Check if README.md already has front matter
open(my $readme_fh, '<', $readme) or die "Cannot open $readme: $!";
my $first_line = <$readme_fh>;
close($readme_fh);

if ($first_line =~ /^---/) {
    print "[SKIP] $readme already has front matter.\n";
    exit 0;
}

# Extract title
my ($title) = $first_line =~ /^#\s*(.*)/;

# Lookup published date
my $published_date_time = "2025-01-01 00:00:00Z";
if (open(my $tsv_fh, '<', $tsv_file)) {
    while (<$tsv_fh>) {
        if (/^$id\t/) {
            ($published_date_time) = (split /\t/)[1];
            last;
        }
    }
    close($tsv_fh);
}
my ($published) = split ' ', $published_date_time;

# Generate description
my $content = `tail -n +2 $readme | head -c 1024`;
chomp $content;

my $description = 'default description';

if ($content) {
    my $cmd = qq{python3 transformer.py};
    eval {
        local $SIG{ALRM} = sub { die "timeout\n" };
        alarm $timeout;

        # Open a pipe to the transformer command
        open(my $pipe, "|-", $cmd) or die "Cannot open pipe to command: $!";
        print $pipe $content;
        close($pipe);

        # Capture the output
        open(my $output, "-|", $cmd) or die "Cannot read from command: $!";
        $description = join("", <$output>);
        close($output);

        alarm 0;
    };
    if ($@) {
        print "[ERROR] Summarization failed for $readme. Logging and continuing.\n";
        print $log_fh "$readme\n";
    }
}

# Clean up the description
$description =~ s/\"//g;          # Remove double quotes
$description =~ s/^\s+|\s+$//g;  # Trim whitespace

# Use description for title if title is empty
$title ||= $description || 'No title';

# Generate image
my $output_image = "$images_dir/image-post-${id}.png";
my $remote_image = $output_image;
eval {
    local $SIG{ALRM} = sub { die "timeout\n" };
    alarm $timeout;
    system("python3 diffusion.py \"$description\" \"$output_image\"");
    alarm 0;
};
if ($@ || $? != 0) {
    print "[ERROR] Image generation failed for $readme. Logging and using placeholder.\n";
    print $log_fh "$readme\n";
    $remote_image = "https://example.com/placeholder.jpg";
}

# Prepend YAML front matter
my ($temp_fh, $temp_file) = tempfile();
print $temp_fh "---\n";
print $temp_fh "title: \"$title\"\n";
print $temp_fh "description: '$description'\n";
print $temp_fh "published: \"$published\"\n";
print $temp_fh "remote-image: \"$remote_image\"\n";
print $temp_fh "draft: false\n";
print $temp_fh "---\n\n";

# Append original content
open($readme_fh, '<', $readme) or die "Cannot open $readme: $!";
while (<$readme_fh>) {
    print $temp_fh $_;
}
close($readme_fh);
close($temp_fh);

# Replace original README.md with the new content
rename($temp_file, $readme) or die "Cannot replace $readme: $!";

print "[OK] Processed $readme\n";
print

