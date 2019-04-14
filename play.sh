#!/bin/bash
FOLDER=$1
FILE="/home/hls/$FOLDER"

if [ $FOLDER = "mosaic" ]; then
    y=0
else
    y=1367
fi
echo $SCREEN
while [ ! -d $FILE ]; do
	sleep 10
	echo "Still waiting for $FOLDER folder to create"
done

echo "Opening player for $FOLDER"
# cvlc --qt-fullscreen-screennumber=$SCREEN -f rtmp://localhost/live/$FOLDER
# cvlc -f rtmp://localhost/live/$FOLDER
smplayer rtmp://localhost/live/$FOLDER -minigui -fullscreen -pos $y 0
# vlc -f rtmp://localhost/live/$FOLDER --no-embedded-video --fullscreen --video-on-top -L --video-x $SCREEN --video-y 0 --no-one-instance
