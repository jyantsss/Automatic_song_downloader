#!/bin/bash

# Check if input file is provided
if [ $# -eq 0 ]; then
    echo "Usage: ./download_songs.sh songs.txt"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_DIR="downloaded_songs"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each line (song name) in the file
while IFS= read -r song; do
    song=$(echo "$song" | xargs) # Trim whitespace
    echo "Searching and downloading: $song"

    yt-dlp \
        "ytsearch1:$song" \
        --match-filter "view_count > 0" \
        --extract-audio \
        --audio-format m4a \
        --output "$OUTPUT_DIR/%(title)s.%(ext)s"

    echo "Done: $song"
    echo ""
done < "$INPUT_FILE"
