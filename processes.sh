#!/bin/bash
watch -n 1 -t "echo ''; ps -Ao comm,pcpu,pmem:6,etime:10 --sort=-pcpu | tail -n +2 | head -n 4 |  sed -e 's/.*/   &/'"