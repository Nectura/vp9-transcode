@echo off
echo Starting VP9 encoding pass 2...
ffmpeg -i "input.mkv" ^
-vf format=yuv420p10le ^
-c:v libvpx-vp9 -profile:v 2 -b:v 0 -crf 20 -pix_fmt yuv420p10le ^
-row-mt 1 -tile-columns 2 -tile-rows 1 -threads 16 -speed 1 -pass 2 -aq-mode 3 ^
-auto-alt-ref 1 -lag-in-frames 25 -g 240 -deadline good ^
-map 0 -c:a copy -c:s copy -map_metadata 0 -map_chapters 0 ^
"output_test.mkv"
echo Pass 2 complete.
echo Encoding finished.