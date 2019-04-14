#!/bin/bash
echo "Converting TV Channels to screen"

echo 'ffmpeg -re 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/11 -an 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/10 -an 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/5 -an 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/4 -an 
-i logoTV.jpg 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/17 -an 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/16 -an 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/1 -an 
-i http://tvsat:Apaansihl03@localhost:9981/stream/channelnumber/15 -an 

-filter_complex "nullsrc=size=1920x1080 
[base];[0:v] setpts=PTS-STARTPTS, scale=640x360 [video1];[1:v] setpts=PTS-STARTPTS, scale=640x360 [video2];[2:v] setpts=PTS-STARTPTS, scale=640x360 [video3];[3:v] setpts=PTS-STARTPTS, scale=640x360 [video4];[4:v] setpts=PTS-STARTPTS, scale=640x360 [video5];[5:v] setpts=PTS-STARTPTS, scale=640x360 [video6];[6:v] setpts=PTS-STARTPTS, scale=640x360 [video7];[7:v] setpts=PTS-STARTPTS, scale=640x360 [video8];[8:v] setpts=PTS-STARTPTS, scale=640x360 [video9];[base][video1] overlay=shortest=0, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=15:y=240:text='BERITA SATU' [tmp1];[tmp1][video2] overlay=shortest=0:x=640, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=655:y=240:text='INDOSIAR' [tmp2];[tmp2][video3] overlay=shortest=0:x=1280, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=1295:y=240:text='METRO TV' [tmp3];[tmp3][video4] overlay=shortest=0:y=360, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=15:y=600:text='NET.' [tmp4];[tmp4][video5] overlay=shortest=0:x=640:y=360 [tmp5];[tmp5][video6] overlay=shortest=0:x=1280:y=360, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=1295:y=600:text='TVONE' [tmp6];[tmp6][video7] overlay=shortest=0:y=720, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=15:y=960:text='TVRI' [tmp7];[tmp7][video8] overlay=shortest=0:x=640:y=720, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=655:y=960:text='TRANS TV' [tmp8];[tmp8][video9] overlay=shortest=0:x=1280:y=720, drawtext=fontfile=/usr/share/fonts/truetype/msttcorefonts/ariblk.ttf:fontsize=30: fontcolor=white:x=1295:y=960:text='JTV'" -c:v libx264 -b:v 768k -s:v 640x480 -pix_fmt yuv420p -r 25 -g 50 -keyint_min 50 -sc_threshold 0 -bf 2 -preset ultrafast -qp 30 -f flv rtmp://localhost/live/mosaic'
