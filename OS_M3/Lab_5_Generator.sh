#!/bin/bash

while true
do
	read line
	echo "$line" >> Lab_5_Connector.txt
	if [[ $line == 'QUIT' ]]
	then
		exit
	fi
done