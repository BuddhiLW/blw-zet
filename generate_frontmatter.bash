#!/usr/bin/env bash
#
# generate_frontmatter.sh
#
# For each directory named with an integer (e.g. 1, 2, 3, ...):
#  1) Read the first line from README.md to get the title (strip out '# ').
#  2) Lookup the corresponding published date/time from ./dex/nodes.tsv
#  3) Generate a short description from ChatGPT (or fallback).
#  4) Generate a DALL·E image URL from the description (or fallback).
#  5) Prepend the YAML front matter to README.md

set -euo pipefail

TSV_FILE="./dex/nodes.tsv"

# Optional: check that TSV file exists
if [[ ! -f "$TSV_FILE" ]]; then
    echo "Error: cannot find $TSV_FILE"
    exit 1
fi

# Loop over directories that match a number
for d in [0-9]*/; do
    # Strip the trailing slash (/) to get the integer ID
    id="${d%/}"
    readme="${d}README.md"

    # If there's no README.md, skip
    if [[ ! -f "$readme" ]]; then
        continue
    fi

    # 1) Extract the first line (title line) from README.md
    first_line="$(head -n 1 "$readme")"
    # Remove leading "# " or "#" to get the actual title
    title="$(echo "$first_line" | sed -E 's/^# *//')"

    # If the title is empty, use the description or fallback to "No title"
    if [[ -z "$title" ]]; then
        if [[ -z "$description" ]]; then
            title="No title"
        else
            title="$description"
        fi
    fi

    # 2) Lookup published date from TSV.
    #    The line structure is something like:
    #      1<TAB>2025-01-11 02:21:31Z<TAB>Trying out KEG
    #
    #    We'll grep by ID at start-of-line:
    line="$(grep -P "^${id}\t" "$TSV_FILE" || true)"
    if [[ -n "$line" ]]; then
        # cut fields by tabs
        # field 1 = ID, field 2 = date/time
        published_date_time="$(echo "$line" | cut -f2)"
    else
        # fallback if none found
        published_date_time="2025-01-01 00:00:00Z"
    fi
    # If you only want the YYYY-MM-DD portion:
    published="$(echo "$published_date_time" | cut -d ' ' -f1)"

    # 3) Generate or retrieve short description
    #    We'll feed the entire README content to ChatGPT
    #    except the first line. Alternatively, feed the entire file.
    #    If you want just the main content, skip the title line:
    content_without_title="$(tail -n +2 "$readme")"

    # You can call ChatGPT summarization or just fallback to default:
    if [[ -z "$content_without_title" ]]; then
        description="default description"
    else
        # Pipe the content to your Python script
        description="$(echo "$content_without_title" | ./get_description.py)"
        # If the script returns empty for some reason:
        if [[ -z "$description" ]]; then
            description="default description"
        fi
    fi

    # 4) Generate an image URL from DALL·E, using the `description` as the prompt
    # Sanitize the description to prevent policy violations
    sanitized_description="$(echo "$description" | sed 's/[^a-zA-Z0-9 .,?!-]//g')"

    # Generate image or fallback on error
    remote_image="$(./image_generator.py "$sanitized_description" 2>/dev/null || echo "https://example.com/placeholder.jpg")"

    if [[ -z "$remote_image" ]]; then
        remote_image="https://example.com/placeholder.jpg"
    fi

    # 5) Prepend YAML front matter. We'll do this by writing
    #    to a temporary file, then move it back.

    tmpfile="$(mktemp)"

    {
        echo "---"
        echo "title: \"$title\""
        echo "description: \"$description\""
        echo "published: \"$published\""
        echo "remote-image: \"$remote_image\""
        echo "draft: false"
        echo "---"
        echo
        # We do NOT remove the first line (# Title), just place frontmatter above it
        cat "$readme"
    } >"$tmpfile"

    mv "$tmpfile" "$readme"

    echo "[OK] Processed $readme"
done
