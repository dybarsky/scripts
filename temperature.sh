#!/bin/bash
setterm --cursor off
length=19
cols=$(tput cols)
lines=$(tput lines)
startColumn=$(((((($cols - $length)) / 2)) + 1))
startLine=$(((($lines / 2)) + 1))
while true; do 
	printf ""
	temp=$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')
	printf "\033[2J \033[${startLine};${startColumn}H"
	printf 'Temperature: '
	printf '\033[1;31m'
	printf "%.1f" $temp
	printf '\033[0m'
	printf '°C'
	sleep 60 
done
