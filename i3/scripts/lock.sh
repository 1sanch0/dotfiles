#!/bin/bash

# Use: lock.sh [-s] 
#         + -s:bool lock and suspend

tmpbg="$(mktemp /tmp/lock.bg-XXXXXXXXXX.png)"
./screenshot -fo | convert -scale 10% -blur 0x2.5 -resize 1000% png:- $tmpbg

cmd="i3lock -i $tmpbg"

while getopts s flag
do
  case "${flag}" in
    s) cmd=${cmd}" && systemctl suspend";;
  esac
done

eval ${cmd}
