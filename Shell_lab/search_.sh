#! /bin/bash
search_(){

    if [[ $# -ne 2 ]]; then 
        echo "search: wrong number of arguments" >&2; return 121
    fi
    if ! [[ -d "$1" ]]; then 
    echo "search: can't access given directory" >&2; return 122;
    fi
    if ! [[ -r "$1" ]]; then 
    echo "search: can't read the file(s)" >&2; return 123; 
    fi

    grep -r $2 $1 2>/dev/null
  
}
