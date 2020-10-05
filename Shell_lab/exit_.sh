#! /bin/bash

exit_(){
    if [[ -z "$1" ]]
    then 
        exit 0
    elif [[ "$1" =~ ^-?[0-9]+$ ]]
    then 
        exit "$1"
    else
        echo "exit: wrong type of exit code" >&2; return 161
    fi
}