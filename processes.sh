#!/bin/bash
watch -n 1 -t -c "
	echo '';
	ps -Ao comm:6,pcpu --sort=-pcpu | 
	tail -n +2 |
 	head -n 5 |
 	sed 's#.*# &#' |
 	sed 's#.*/# #' | 
 	sed 's#[^[:digit:]]\+#\x1b[37;2m & \x1b[0m#'
"
# sed 's/.*\/[^[:digit:]]\+/\x1b[37;2m & \x1b[0m/'
# sed 's/[^[:digit:]]\+/\x1b[37;2m&\x1b[0m/'
# sed 's/[a-zA-Z/]\+/\x1b[31m&\x1b[0m/'
# sed -e 's/[a-zA-Z]+/\x1b[31m&\x1b[0m/'