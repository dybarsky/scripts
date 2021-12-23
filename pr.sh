#!/bin/bash
setterm --cursor off
setterm --linewrap off
clear
while true; do
	#out=$(gh pr status) // colors not working 
	gh pr status &
	sleep 0.5
    echo -e "\033[2J \033[0;0H"
	#echo -e "$out"
	sleep 30 
done