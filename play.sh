#!/bin/bash
FOLDER=$1
FILE="/home/hls/$FOLDER"

if [ $FOLDER = "mosaic" ]; then
    SCREEN=0
else
    SCREEN=1
fi
echo $SCREEN
while [ ! -d $FILE ]; do
	sleep 10
	echo "Still waiting for $FOLDER folder to create"
done

echo "Opening player for $FOLDER"
vlc --qt-fullscreen-screennumber=$SCREEN -f rtmp://localhost/live/$FOLDER

# cvlc -f rtmp://localhost/live/$FOLDER --no-embedded-video --fullscreen --video-on-top -L --video-x $SCREEN --video-y 0 --no-one-instance
