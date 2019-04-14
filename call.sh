#!/bin/bash
# Declare array
declare -a ARRAY
# Link filedescriptor 10 with stdin
exec 10<&0
# stdin replaced with a file supplied as a first argument
exec < $1
let count=0

while read LINE; do

    ARRAY[$count]=$LINE
    ((count++))
done

#echo Number of elements: ${#ARRAY[@]}
ELEMENTS=${ARRAY[@]}
# echo array's content
# echo ${ARRAY[@]}
# restore stdin from filedescriptor 10
# and close filedescriptor 10
exec 0<&10 10<&-
if [ $1 = "list.cast" ]; then
    ARRAY=( 'BERITA SATU' INDOSIAR 'METRO TV' 'NET.' TVONE TVRI 'TRANS TV' JTV);
    STRADDR="rtmp://localhost/live/mosaic"
    # NAMA=${#ARRAY[@]}
    # for (( i=0;i<$NAMA;i++)); do
    #     echo ${ARRAY[${i}]}
    # done
else 
    ARRAY=( ANTV ALJAZEERA JAKTV 'KOMPAS TV' RRI SCTV 'TRANS 7' DW);
    STRADDR="rtmp://localhost/live/mosaic2"

fi
#     text=${ARRAY[1]}
#    echo $text


exec ffmpeg -re $ELEMENTS -filter_complex "nullsrc=size=1920x1080 [base];[0:v] setpts=PTS-STARTPTS, scale=640x360 [video1];[1:v] setpts=PTS-STARTPTS, scale=640x360 [video2];[2:v] setpts=PTS-STARTPTS, scale=640x360 [video3];[3:v] setpts=PTS-STARTPTS, scale=640x360 [video4];[4:v] setpts=PTS-STARTPTS, scale=640x360 [video5];[5:v] setpts=PTS-STARTPTS, scale=640x360 [video6];[6:v] setpts=PTS-STARTPTS, scale=640x360 [video7];[7:v] setpts=PTS-STARTPTS, scale=640x360 [video8];[8:v] setpts=PTS-STARTPTS, scale=640x360 [video9];[base][video1] overlay=shortest=0, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=15:y=240:text=${ARRAY[0]} [tmp1];[tmp1][video2] overlay=shortest=0:x=640, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=655:y=240:text=${ARRAY[1]} [tmp2];[tmp2][video3] overlay=shortest=0:x=1280, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=1295:y=240:text=${ARRAY[2]} [tmp3];[tmp3][video4] overlay=shortest=0:y=360, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=15:y=600:text=${ARRAY[3]} [tmp4];[tmp4][video5] overlay=shortest=0:x=640:y=360 [tmp5];[tmp5][video6] overlay=shortest=0:x=1280:y=360, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=1295:y=600:text=${ARRAY[4]} [tmp6];[tmp6][video7] overlay=shortest=0:y=720, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=15:y=960:text=${ARRAY[5]} [tmp7];[tmp7][video8] overlay=shortest=0:x=640:y=720, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=655:y=960:text=${ARRAY[6]} [tmp8];[tmp8][video9] overlay=shortest=0:x=1280:y=720, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=1295:y=960:text=${ARRAY[7]}" -c:v libx264 -b:v 768k -s:v 640x480 -pix_fmt yuv420p -r 25 -g 50 -keyint_min 50 -sc_threshold 0 -bf 2 -preset ultrafast -qp 30 -f flv $STRADDR


