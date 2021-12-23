#!/bin/sh
echo 'ip:   192.168.178.21'
echo 'port: '
printf '\033[1A\033[6C'
read port
adb connect 192.168.178.21:$port