#!/bin/bash
setterm --cursor off
while true; do 
	printf '\033[2J \033[2;3H'
	curl wttr.in/Berlin?0q
	sleep 900 
done
