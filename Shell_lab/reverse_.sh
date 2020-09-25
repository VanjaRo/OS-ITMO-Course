#! /bin/bash

if [[ $# -ne 2 ]]
then 
    exit 131
fi

if ! [[ -r "$1" ]]
then 
    exit 132
fi


if [[ -f "$2" ]]
then 
    if ! [[ -w "$2" ]]
    then 
        exit 133
    fi
else 
    dir=$(dirname "$2")
    if ! [[ -d "$dir" ]]; then exit 134; fi
    if ! [[ -w "$dir" ]]; then exit 135; fi

fi

echo "Write to the end of a file or rewrite full file (w / rw)?"
read inpt
case "$inpt" in
    w) tac $1 >> $2
    ;;
    rw) tac $1 > $2
    ;;
    *) exit 136
esac
