#!/bin/sh
SNAP_DIR=./snaps/
SNAP_PREFIX=snap
SNAP_ID=`date '+%Y%m%d-%H%M%S'`

SNAP_PATH=$SNAP_DIR$SNAP_PREFIX-$SNAP_ID.jpg

mkdir -p $SNAP_DIR

echo "\033[107m"
clear

v4l2-ctl --stream-mmap=3 --stream-count=1 --stream-to=$SNAP_PATH

fbi -1 -t 5 $SNAP_PATH
