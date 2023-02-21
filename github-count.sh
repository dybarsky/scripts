#!/bin/bash
cols=$(tput cols)
lines=$(tput lines)
while true; do 
	printf "\033[2J"
	printf "\033[1;34m"
	gh api \
	--header "X-GitHub-Api-Version:$GH_REST_API_VERSION" \
	--method GET notifications \
	--cache=0s \
	--template '{{range .}}{{ printf "●\n"}}{{end}}' \
	| wc -l \
	| figlet -w ${cols} -c -f small
	printf '\033[0m'
	sleep 60 
done
