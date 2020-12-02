#!/bin/bash

ppid='0'
newppid=''
avg='0'
count='0'
avg_atom=''
echo -e '' > res_v.txt
while read str
do
	newppid=$(echo $str | grep -oP 'Parent_ProcessID=[0-9]+' | grep -oP '[0-9]+')
	if [[ $newppid -ne $ppid ]]
	then
			avg=$(echo $avg $count | awk '{ print $1/$2 }')
			echo 'Average_Sleeping_Children_of_ParentID='$ppid' is '$avg >> res_v.txt
			ppid=$newppid
			count='0'
			avg='0'
	fi
	avg_atom=$(echo $str | grep -oP 'Average_Time=[0-9\.]+' | grep -oP '[0-9\.]+')
	avg=$(echo $avg $avg_atom | awk '{ print $1+$2 }')
	let count=$count+1
	echo $str >> res_v.txt
done < res_iv.txt

avg=$(echo $avg $count | awk '{ print $1/$2 }')
echo 'Average_Sleeping_Children_of_ParentID='$ppid' is '$avg >> res_v.txt
