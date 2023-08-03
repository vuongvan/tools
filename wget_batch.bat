@echo off
:: Set environment
set PATH=%PATH%;E:\bin
set ffmpeg_location="E:\bin\ffmpeg"
:: Using wget to download bat file.
wget -q ytdlp_exc.bat - O  ytdlp_exc.bat
::Run downloaded bat file.
ytdlp_exc.bat
