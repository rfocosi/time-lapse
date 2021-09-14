#!/bin/bash
DIR=$1

[ -z "$DIR" ] && echo "Missing parameter: target directory" && exit 1

eval "$( cat time-lapse.config )"

[ -z "$FILE_MASK" ] && echo "Missing config: FILE_MASK" && exit 2

count=0
for entry in `ls -1 $DIR/*.jpg`
do
	printf -v name "$DIR/$FILE_MASK" $count
	echo "$entry -> $name"
	mv $entry $name
	let count++
done
