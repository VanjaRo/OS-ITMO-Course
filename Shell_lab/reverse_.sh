#! /bin/bash

reverse_(){
    if [[ $# -ne 2 ]]
    then 
        echo "reverse: wrong number of arguments" >&2; return 131
    fi

    if ! [[ -r "$1" ]]
    then 
        echo "reverse: can't access given input file" >&2; return 132
    fi


    if [[ -f "$2" ]]
    then 
        if ! [[ -w "$2" ]]
        then 
            echo "reverse: can't write the given file" >&2; return 133
        fi
    else 
        dir=$(dirname "$2")
        if ! [[ -d "$dir" ]]; then
            echo "reverse: can't access to the given output file directory" >&2; return 134;
        fi
        if ! [[ -w "$dir" ]]; then 
            echo "reverse: can't write to the given output file directory" >&2; return 135; 
        fi

    fi

    tac $1 >> $2
}
