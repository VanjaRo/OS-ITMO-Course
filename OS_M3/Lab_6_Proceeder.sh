#!/bin/bash

echo $$ > .pid

mode="+"
result=1

onUsr1()
{
	echo "Adding"
	mode="+"
}
onUsr2()
{
	echo "Multiplying"
	mode="*"
}
onTerm()
{
	echo "Termination because of SIGTERM from generator, result is" $result
	exit 0
}
trap 'onUsr1' USR1
trap 'onUsr2' USR2
trap 'onTerm' SIGTERM

while true ; do
	sleep 1s
	case $mode in
		"+")
			let result="$result+2"
			echo $result
			;;
		"*")
			let result="$result*2"
			echo $result
			;;
	esac
done