#! /bin/bash

if [[ $# -ne 2 ]]
then 
    exit 131
fi
elif [[ (-f "$1") && (-r "$1") ]]
then 
    exit 132
fi
elif [[ (-f "$2") && (-w "$2") ]]
then 
    exit 133
fi

true > "$2"

echo "Write to the end of a file or rewrite full file (w / rw)?"
read inpt
case "$inpt" in
    w) tac $1 >> $2
    ;;
    rw) tac $1 > $2
    ;;
    *) exit 134
esac
