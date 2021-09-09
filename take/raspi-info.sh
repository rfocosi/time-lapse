#!/bin/sh

setterm -blank 0 -powersave off

/home/rfocosi/bin/listen-mouse.sh > /tmp/listen-mouse.log 2>&1 &

while true; do
  ip=`ip addr show scope global | grep inet | grep -v inet6 | cut -d' ' -f6 | cut -d/ -f1`
  up=`uptime | awk -F"up " '{print $2}' | awk -F"," '{print $1}'`
  used=`df -h | grep 'dev/root' | awk '{print $3}'`
  avail=`df -h | grep 'dev/root' | awk '{print $4}'`
  usb_used=`df -h | grep 'dev/sda1' | awk '{print $3}'`
  usb_avail=`df -h | grep 'dev/sda1' | awk '{print $4}'`

  clear

  echo "\033[0;32m
    .~~.   .~~.
   '. \ ' ' / .'\033[0;31m
    .~ .~~~..~.
   : .~.'~'.~. :
  ~ (   ) (   ) ~
 ( : '~'.~.'~' : )
  ~ .~ (   ) ~. ~  \033[0;37m Raspiberry Pi \033[0;31m
   (  : '~' :  )
    '~ .~~~. ~'
        '~'

    \033[0;34m`hostname -f`
    \033[1;30m$ip

    \033[1;30mUptime: $up

    \033[1;34mDev  | Used | Free
    root | $used | $avail"

    [ "$usb_avail" ] && echo "    usb  | $usb_used | $usb_avail"

    echo "\033[0;30m"

  sleep 60
done
