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

# Loop through each line (YouTube URL) in the file
Get-Content $INPUT_FILE | ForEach-Object {
    $url = $_.Trim()
    
    if ($url -ne "") {
        Write-Host "Downloading from: $url"

        yt-dlp `
            $url `
            --extract-audio `
            --audio-format m4a `
            --output "$OUTPUT_DIR\%(title)s.%(ext)s"

        Write-Host "Download complete"
        Write-Host ""
    }
}
