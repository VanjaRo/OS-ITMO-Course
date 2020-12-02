#!/bin/bash
res=1
mode="+"
echo "Started!"
echo "Result=$res"
(tail -n 0 -f Lab_5_Connector.txt) |
while true;
do
read LINE;
case $LINE in
	QUIT)
		echo "Planned exit, result is" $result
		killall tail
		exit
		;;
	"+")
		echo "Adding"
		mode="+"
		echo "Enter number"
		;;
	"*")
		echo "mul"
		mode="*"
		echo "Enter number"
	[0-9])
		let "res=res$mode$LINE"
		echo "Result=$res"
		;;
	*)
		echo "Error in input, result is" $result
		killall tail
		exit 0
		;;
esac
done