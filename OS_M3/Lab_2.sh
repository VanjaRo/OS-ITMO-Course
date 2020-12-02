#!/bin/bash
at -t $(date --date='2 minutes' +'%m%d%H%M.%S') -f './Task1.sh'
date --date='2 minutes'
(tail -n 0 -f ~/report) | 
while true
do
	read line
	echo '['$(date)']' $line
done
