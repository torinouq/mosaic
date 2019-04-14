#!/bin/bash
file="./file"
# if [ -e $file ]; then
# 	echo "File exists"
# else 
# 	echo "File does not exists"
# fi 

# while ! test -f $file; do
#   sleep 10
#   echo "Still waiting"
# done

# echo "got it"
# gnome-terminal --working-directory=/home/tvmon/mosaic --window -- 
# gnome-terminal --window --  smplayer ../BBB_vid_360.mp4 -minigui -fullscreen -pos 1367 0 &
# gnome-terminal --window --  smplayer ../BBB_vid_360.mp4 -minigui -fullscreen -pos 0 0
cmd="ls -al | grep e"
gnome-terminal --working-directory=/home/tvmon/mosaic --window -- && bash -c "$cmd"