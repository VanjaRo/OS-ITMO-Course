#!/bin/bash
read pid < .pid

while true ; do
	read line
	case $line in
		"+")
			kill -USR1 $pid
			;;
		"*")
			kill -USR2 $pid
			;;
		"TERM")
			kill $pid
			break
			;;
	esac
done