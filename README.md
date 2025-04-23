# Automatic_Song_Downloader

This repository provides a script to **automatically download songs from YouTube**. Just add the song names (or links) in a `.txt` file and run the script — the songs will be downloaded in audio format.

📌 Features

This repo includes **three types of download scripts**:

1. ✅ Download based on **search relevance**.
2. 📈 Download the one with **highest views** among top search results.
3. 🔗 Download using **direct YouTube links** (for less popular songs).

You can choose any as per your preference.

🔧 Requirements

Before using the script, install these tools:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp): For downloading from YouTube.
- [ffmpeg](https://ffmpeg.org/): For converting MP4 to M4A audio.

---

## 🐧 Linux Installation Guide

Step 1: Download yt_dpl

`sudo curl -L [https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp](https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp) -o /usr/local/bin/yt-dlp`

Step 2: Give **everyone (all users)** the ability to **read and run** the `yt-dlp` tool.

`sudo chmod a+rx /usr/local/bin/yt-dlp`

Step 3: To ensure it has been downloaded, download one song

`yt-dlp "ytsearch1:Shape of You"`

Step 4: Install ffmpeg using following commands sequentially

`sudo apt update && sudo apt upgrade -y`

`sudo apt install ffmpeg -y`

`ffmpeg version`

Step 5: Create a .txt file with songs name in it. eg: songs.txt and prepare your songs list

`nano songs.txt`

Step 6: Create a .sh file for script code

`nano script.sh`

Enter the script code in it and then

`chmod 755 [dscript.sh](http://dscript.sh/)`

Step 7: Run your script

 `./dscript.sh songs.txt`

## **🪟 Windows Installation Guide:**

For more ease, use cmd to download rather than mannually downloading through sites.

Step 1: Install yt_dlp

Open cmd and run

`pip install -U yt-dlp`

Note: python must be installed in your system to run this command. If not follow a youtube video and download

Step2: Install ffmpeg

Open cmd as administrator otherwise may cause error

`mkdir C:\ffmpeg`

`cd C:\ffmpeg`

`curl -L -o ffmpeg.zip [https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip](https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip)`

`tar -xf ffmpeg.zip`

`dir`

You will see something like

```
ffmpeg-7.0-essentials_build
```

Now rename it to

```
ffmpeg
```

to keep the path clean.

`rename ffmpeg-7.0-essentials_build ffmpeg`

`dir C:\ffmpeg\ffmpeg\bin`

If you see `ffmpeg.exe` there — great!

`setx PATH "%PATH%;C:\ffmpeg\ffmpeg\bin"`

`ffmpeg -version`

Step 3: Create a file named as songs.txt and add the songs you want to be downloaded line by line

`Notepad songs.txt`

Step4: Create a .ps1 file to enter the script code

`Notepad downloader.ps1`

and enter the script code in it

Step5: Run your script

`powershell -ExecutionPolicy Bypass -File "download.ps1" "songs.txt"`

You will see downloaded songs inside a folder in your working directory.

---

## 📂 File Structure

```
plaintext
CopyEdit
├── songs.txt          # List of songs or links
├── script.sh          # Linux shell script
├── downloader.ps1     # Windows PowerShell script

```

## **🤝 Contributing**

```markdown
Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit and push your changes (`git commit -m "Add new feature"`).
5. Submit a pull request.
```

## Happy Downloading! 🎶