#!/bin/bash

unset TERM

mev -E | egrep --line-buffered "down-mouse-1" | while read LINE
do
  echo "Power off..."
  poweroff
done


