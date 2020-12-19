#!/bin/bash

declare -a array
declare -a numbers=(1,2,3,4,5,6,7,8,9,10)

counter=0

if [[ $# == 0 ]]; then
	N=3200000
else
	N=$1
fi

while true
do
	array+=(${numbers[@]})
	let "counter++"
	if [[ $counter == 100000 ]]
	then
		counter=0
		if [[ ${#array[@]} -eq $N ]]
		then
			echo "$N"
			exit 0
		fi	
	fi
done
