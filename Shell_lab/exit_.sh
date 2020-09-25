#! /bin/bash

if [[ -z $1 ]]
then 
    exit 0
elif [[ $1 =~ ^-?[0-9]+$ ]]
then 
    exit "$1"
else
    exit 161
fi