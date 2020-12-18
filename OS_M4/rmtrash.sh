#!/bin/bash

file="$1"

if [[ $# > 1 ]]; 
then
    echo "Too many arguments."
    exit 1
fi

if [[ $# < 1 ]]; 
then
    echo "Too little arguments."
    exit 2
fi

if [[ ! -d ~/.trash ]]
then
	mkdir ~/.trash
fi

if [[ ! -e "$file" ]]
then
	echo $file "does not exists."
	exit 3
fi

if [[ -d "$file" ]]
then
	echo $file "is a directory."
	exit 4
fi

# if [ ! "`echo $file | sed 's/[a-z,0-9,_,-]*//'`" == "" ];
# then
#     echo "Bad user input."
#     exit 5
# fi

id=$(find "~/.trash/" -type f -name "[1-9]" | sed -e 's,.trash/,,')
id=$(echo $id | awk '{print $NF}')

if [ -z $id ];
then
    ln "$file" "~/.trash/1"
else
    id=$(($id + 1))
    ln "$file" "~/.trash/$id"
fi

echo "$(readlink -f $file) $id"  >> "~/.trash.log"
rm $file