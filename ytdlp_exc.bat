#!/bin/bash

#yt-dlp
YTDLPBIN=yt-dlp.exe
YTDLPBINURL=https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe
DIRCONF=dir.conf
#COLORS
RED='\033[0;31m'
Green='\033[0;32m'

ffmpeg_location=$(echo | awk 'NR==1' $DIRCONF )

while (true)
do
	echo -e "\n${Green}Chọn thao tác cần thực hiện: ************"
	echo "  1) Tải mp3"
	echo "  2) Tải video kèm sub (mkv)"
	echo "  3) Tải mp3 kèm tách chapter"
	echo "  4) Thoát chương trình"
	echo "  0) Tải lại file $YTDLPBIN"
	read n

	case $n in
	  1)
		echo -e "${Green}Nhập link youtube cần tải mp3: " 
		read -r YouTubeURL 
		./yt-dlp.exe --ffmpeg-location $ffmpeg_location --extract-audio --audio-format mp3 -P $PWD/Download// $YouTubeURL
		;;
	  2)
		echo -e "${Green}Nhập link youtube cần tải video: " 
		read -r YouTubeURL 
		./yt-dlp.exe --ffmpeg-location $ffmpeg_location --no-mtime --sponsorblock-mark intro,outro --embed-chapters --convert-subs srt --embed-subs --sub-langs vi,en -f 247+bestaudio/best/247 --merge-output-format mkv --extractor-args "youtube:lang=en" -P $PWD/Download// $YouTubeURL
		;;
	  3)
		echo -e "${Green}Nhập link youtube cần tải mp3: " 
		read -r YouTubeURL 
		./yt-dlp.exe --ffmpeg-location $ffmpeg_location --extract-audio --audio-format mp3 -P $PWD/Download// --split-chapters -o "chapter:%(section_title)s.%(ext)s" $YouTubeURL
		;;
	  4)
		exit ;;
	 
	  0)
		echo -e "${Green}Đang tải xuống file $YTDLPBIN"
		wget -q --show-progress $YTDLPBINURL -O  $YTDLPBIN;;

	  *) 
		echo "invalid option";;
	esac
done
