#! /bin/bash
strlen_(){
    if [[ $# -lt 1 ]]; then 
       echo "strlen: wrong number of arguments " >&2; return 141
    fi

    var="$1"
    echo ${#var}
}