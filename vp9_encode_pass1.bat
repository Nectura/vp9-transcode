@echo off
echo Starting VP9 encoding pass 1...
ffmpeg -i "input.mkv" ^
-vf format=yuv420p10le ^
-c:v libvpx-vp9 -b:v 0 -crf 20 -pix_fmt yuv420p10le ^
-row-mt 1 -tile-columns 2 -tile-rows 1 -threads 16 -speed 4 -pass 1 -an -sn -f null NUL
echo Pass 1 complete.
