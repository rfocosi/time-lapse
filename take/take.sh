#!/bin/bash
SNAP_DIR=/home/rfocosi/smbrepo/
SNAP_PREFIX=snap
SNAP_ID=`date '+%Y%m%d-%H%M%S'`

SNAP_PATH=$SNAP_DIR$SNAP_PREFIX-$SNAP_ID.jpg

v4l2-ctl --stream-mmap=3 --stream-count=1 --stream-to=$SNAP_PATH
sleep 1
fbi -1 -t 5 $SNAP_PATH

