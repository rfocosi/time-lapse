#!/bin/sh
DIR=$1

[ -z "$DIR" ] && echo "Missing parameter: target directory" && exit 1

eval "$( cat time-lapse.config )"

[ -z "$FILE_MASK" ] && echo "Missing config: FILE_MASK" && exit 2

mkdir -p output

ffmpeg -framerate 23 -i $DIR/$FILE_MASK -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p output/$DIR.mp4
