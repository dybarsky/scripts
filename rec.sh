#!/bin/bash
trap ' ' INT
file="/home/maksym/pics/device/$(date +%s).mp4"
printf 'recording\n'
adb shell screenrecord /sdcard/video.mp4
printf '\033[10D'
printf '\033[2K'
sleep .5
printf 'downloading\n'
adb pull /sdcard/video.mp4 . > /dev/null
adb shell rm /sdcard/video.mp4
printf 'moving\n'
mv video.mp4 $file