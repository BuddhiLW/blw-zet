#!/usr/bin/env bash

set -euo pipefail

TSV_FILE="./dex/nodes.tsv"
IMAGES_DIR="./images"
LOG_FILE="./unprocessed_files.log"
TIMEOUT_DURATION=30

# Ensure the images directory exists
mkdir -p "$IMAGES_DIR"

# Clear the log file for unprocessed files
> "$LOG_FILE"

# Check for an argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <note_id>"
    exit 1
fi

# Get the specific directory to process
id="$1"
d="${id}/"
readme="${d}README.md"

# Skip if no README.md
if [[ ! -f "$readme" ]]; then
    echo "[SKIP] No README.md found for $d"
    exit 0
fi

# Check if already has front matter
if head -n 1 "$readme" | grep -q '^---'; then
    echo "[SKIP] $readme already has front matter."
    exit 0
fi

# Extract title
first_line="$(head -n 1 "$readme")"
title="$(echo "$first_line" | sed -E 's/^# *//')"

# Lookup published date
line="$(grep -P "^${id}\\t" "$TSV_FILE" || true)"
if [[ -n "$line" ]]; then
    published_date_time="$(echo "$line" | cut -f2)"
else
    published_date_time="2025-01-01 00:00:00Z"
fi
published="$(echo "$published_date_time" | cut -d ' ' -f1)"

# Generate description
content_without_title="$(tail -n +2 "$readme" | head -c 1024)"
if [[ -z "$content_without_title" ]]; then
    description='default description'
else
    if ! description="$(timeout "$TIMEOUT_DURATION" python3 transformer.py <<<"$content_without_title")"; then
        echo "[ERROR] Summarization failed for $readme. Logging and continuing."
        echo "$readme" >>"$LOG_FILE"
        description='default description'
    fi
fi

# Sanitize description
description="$(echo "$description" | sed 's/\"//g')"

# Use description for title if title is empty
if [[ -z "$title" ]]; then
    title="${description:-No title}"
fi

# Generate image
output_image="$IMAGES_DIR/image-post-${id}.png"
echo "Generating image for description: $description"
if ! timeout "$TIMEOUT_DURATION" python3 diffusion.py "$description" "$output_image"; then
    echo "[ERROR] Image generation failed for $readme. Logging and using placeholder."
    echo "$readme" >>"$LOG_FILE"
    remote_image="https://example.com/placeholder.jpg"
else
    remote_image="$output_image"
fi

# Prepend YAML front matter
tmpfile="$(mktemp)"
{
    echo "---"
    echo "title: \"$title\""
    echo "description: \"$description\""
    echo "published: \"$published\""
    echo "image: \"$remote_image\""
    echo "draft: false"
    echo "---"
    echo
    cat "$readme"
} >"$tmpfile"

mv "$tmpfile" "$readme"

echo "[OK] Processed $readme"
echo "Processing complete. Check $LOG_FILE for unprocessed files."

