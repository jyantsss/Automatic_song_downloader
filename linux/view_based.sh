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

# Loop through each song in the input file
while IFS= read -r song; do
    song=$(echo "$song" | xargs) # Trim spaces
    echo "Searching top-viewed video for: $song"

    # Get top 3 search results as JSON array
    videos_json=$(yt-dlp "ytsearch3:$song" --print-json --skip-download)

    if [ -z "$videos_json" ]; then
        echo "No search results found for $song"
        continue
    fi

    # Parse JSON and find the video with the highest view count
    highest_video_url=""
    highest_view_count=0
    highest_title=""

    # Process each JSON object
    while IFS= read -r video_json; do
        view_count=$(echo "$video_json" | jq '.view_count')
        title=$(echo "$video_json" | jq -r '.title')
        url=$(echo "$video_json" | jq -r '.webpage_url')

        if [ "$view_count" -gt "$highest_view_count" ]; then
            highest_view_count=$view_count
            highest_video_url=$url
            highest_title=$title
        fi
    done <<< "$videos_json"

    if [ -n "$highest_video_url" ]; then
        echo "Downloading: $highest_title with $highest_view_count views"
        yt-dlp \
            "$highest_video_url" \
            --extract-audio \
            --audio-format m4a \
            --output "$OUTPUT_DIR/%(title)s.%(ext)s"
        echo "Done: $highest_title"
    else
        echo "No valid video found for $song"
    fi

    echo ""
done < "$INPUT_FILE"
