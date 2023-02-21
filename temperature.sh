#!/bin/bash
#setterm --cursor off
length=16
height=4

printf "\033[2J"
while true; do 
	cols=$(tput cols)
	lines=$(tput lines)
	column=$(((((($cols - $length)) / 2)) + 1))
	line=$(((($lines / 2)) - $(($height / 2)) + 1))
	printf "\033[${line};0H"		
	sensors \
		| grep -A 0 'Core' \
		| cut -c17-20 \
		| awk '{print "\033[0;31m" $0 "\033[0m°C"}' \
		| nl -w2 -s ':  ' \
		| awk '{print "Core" $0}' \
		| while read line; do 
			printf "\033[${column}C$line\n"
		done
	sensors \
		| grep -A 0 'Composite' \
		| cut -c16-19 \
		| awk '{print "\033[0;31m" $0 "\033[0m°C"}' \
		| awk '{print "SSD:     " $0}' \
		| while read line; do
			printf "\033[${column}C$line\n"
		done
	sleep 1
done
