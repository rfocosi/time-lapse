#!/bin/bash
DIR=$1

[ -z "$DIR" ] && echo "Missing parameter: target directory" && exit 1

FILE_MASK=`./file_mask.sh`

count=0
for entry in `ls -1 $DIR/*.jpg`
do
	let count++
	printf -v name "$DIR/$FILE_MASK" $count
	echo "$entry -> $name"
	mv $entry $name
done
