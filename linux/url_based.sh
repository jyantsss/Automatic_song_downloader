#!/bin/bash

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "Usage: ./download_songs.sh urls.txt"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="downloaded_songs"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each line (YouTube URL) in the file
while IFS= read -r url; do
    url=$(echo "$url" | xargs)  # Trim whitespace

    if [ -n "$url" ]; then
        echo "Downloading from: $url"

        yt-dlp \
            "$url" \
            --extract-audio \
            --audio-format m4a \
            --output "$OUTPUT_DIR/%(title)s.%(ext)s"

        echo "Download complete"
        echo ""
    fi
done < "$INPUT_FILE"
