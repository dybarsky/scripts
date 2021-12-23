#!/bin/bash
setterm --cursor off
length=10
cols=$(tput cols)
lines=$(tput lines)
startColumn=$(((((($cols - $length)) / 2)) + 1))
startLine=$(((($lines / 2)) + 1))
while true; do 
	printf ""
	usage=$(df --output=pcent / | tail -n +2)
	printf "\033[2J \033[${startLine};${startColumn}H"
	printf 'Disk: '
	printf '\033[1;34m'
	printf ${usage::-1}
	printf '\033[0m'
	echo -e " %"
	sleep 300 
done
