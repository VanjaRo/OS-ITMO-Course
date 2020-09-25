#! /bin/bash

if [[ $# -ne 2 ]]
then 
    exit 121
fi
if [[ -d "$1" ]]
then 
    if [[ -r "$2" ]]
    then
        grep -r $2 $1 2>/dev/null
    else
        exit 122
    fi
else 
    exit 123
fi
