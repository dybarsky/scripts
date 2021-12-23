#!/bin/sh
file="/home/maksym/pics/device/$(date +%s).png"
adb exec-out screencap -p > $file 
