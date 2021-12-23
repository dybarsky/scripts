#!/bin/bash
trap ' ' INT
file="/home/maksym/pics/device/$(date +%s).gif"
printf 'recording\n'
adb shell screenrecord /sdcard/video.mp4
printf '\033[10D'
printf '\033[2K'
sleep .5
printf 'downloading\n'
adb pull /sdcard/video.mp4 . > /dev/null
adb shell rm /sdcard/video.mp4
printf 'converting\n'
ffmpeg -i video.mp4 -vf "fps=24,scale=1080:-1:flags=lanczos" -loglevel 0 $file
rm video.mp4