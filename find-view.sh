#!/bin/bash
dump=$(adb shell uiautomator dump | grep -oP '[^ ]+.xml')
adb pull $dump /tmp/dump.xml 1>/dev/null
bounds=$(xmlstarlet sel -t -v "//node[@text='$1']/@bounds" /tmp/dump.xml)
echo $bounds | \
	grep -o '[0-9]*' | \
	sed -z 's/\n/,/g' | \
	awk -F ',' '{print ($1+$3)/2" "($2+$4)/2}'