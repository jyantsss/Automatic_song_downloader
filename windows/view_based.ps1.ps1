# Check if input file is provided
if ($args.Length -eq 0) {
    Write-Host "Usage: .\download_songs.ps1 songs.txt"
    exit 1
}

$INPUT_FILE = $args[0]
$OUTPUT_DIR = "downloaded_songs"

# Create output directory if it doesn't exist
if (-not (Test-Path -Path $OUTPUT_DIR)) {
    New-Item -ItemType Directory -Path $OUTPUT_DIR
}

# Loop through each song in the input file
Get-Content $INPUT_FILE | ForEach-Object {
    $song = $_.Trim()
    Write-Host "Searching top-viewed video for: $song"

    # Get top 3 search results as JSON
    $videos = yt-dlp "ytsearch3:$song" --print-json --skip-download | ForEach-Object {
        $_ | ConvertFrom-Json
    }

    # Find the video with the highest view count
    $highest = $videos | Sort-Object -Property view_count -Descending | Select-Object -First 1

    if ($highest) {
        Write-Host "Downloading: $($highest.title) with $($highest.view_count) views"

        yt-dlp `
            $highest.webpage_url `
            --extract-audio `
            --audio-format m4a `
            --output "$OUTPUT_DIR\%(title)s.%(ext)s"

        Write-Host "Done: $($highest.title)"
    } else {
        Write-Host "No valid video found for $song"
    }

    Write-Host ""
}
