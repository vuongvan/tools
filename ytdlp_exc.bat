@echo off
set ffmpeg_location="E:\SOFT\ffmpeg"
:START
ECHO.
ECHO 1. Tai mp3
ECHO 2. Tai video
ECHO 3. Tai video kem sub (mkv)
ECHO.
set choice=
set /p choice=Chon thao thac muon thuc hien: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto music
if '%choice%'=='2' goto video
if '%choice%'=='3' goto videosub
ECHO "%choice%" Vui long chon lai thao tac muon thuc hien.
ECHO.
goto start

:music
cls
ECHO Tai mp3
ECHO.
set /p YouTubeURL=Nhap Link Youtube: 
yt-dlp --ffmpeg-location %ffmpeg_location% --extract-audio --audio-format mp3 %YouTubeURL%
echo:
echo:
cls
GOTO START

:video

:videosub
cls
ECHO Tai video kem sub
ECHO.
set /p YouTubeURL=Nhap Link Youtube: 
yt-dlp --ffmpeg-location %ffmpeg_location% -N 6 --no-mtime --sponsorblock-mark intro,outro --embed-chapters --convert-subs srt --embed-subs --sub-langs vi,en -f 247+bestaudio/best/247 --merge-output-format mkv  %YouTubeURL%
echo:
echo:
cls
GOTO videosub

:end
pause
