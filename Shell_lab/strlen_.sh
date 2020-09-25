#! /bin/bash

if [[ $# -lt 1 ]]
then 
    exit 141
fi

var="$1"
echo ${#var}