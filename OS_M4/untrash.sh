#!/bin/bash

TRASHDIR="~/.trash/"
TRASHLOG="~/.trash.log"
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

if [[ ! -d $TRASHDIR ]];
then
    echo "Directory does not exist."
    exit 3
fi

if [[ ! -f $TRASHLOG ]];
then
    echo "Log file does not exist."
    exit 4
fi

if [ ! "`echo $file | sed 's/[a-z,0-9,_,-]*//'`" == "" ];
then
    echo "Bad user input."
    exit 5
fi

for i in $(grep "$1" $TRASHLOG | awk '{print $NF}');
do
    FILENAME=$(grep $i $TRASHLOG | awk '{$NF=""; print $0}')
    FILENAME=$(echo "$FILENAME" | sed 's/ *$//')
    read -p "${FILENAME} Are you sure?: [y/n] " ans
    case "$ans" in
        "y")
            NFN=""
            TN=$i
            RDIR=$(echo "$FILENAME" | awk 'BEGIN{FS=OFS="/"}; {$NF=""; print $0}')
            FNN=$(echo "$FILENAME" | awk 'BEGIN{FS="/"}; {print $NF}')
            if [[ ! -d $RDIR ]];
            then
                echo "Directory ${RDIR} not found. File \"${FNN}\" restored in HomeDirectory"
                if [[ -f "${HOM}/${FNN}" ]];
                then
                    read -p "File \"${HOM}/${FNN}\" already exist. Add new name: " NFN
                    ln "${TRASHDIR}/${TN}" "${HOM}/${NFN}"
                    rm "${TRASHDIR}/${TN}"
                else
                    ln "${TRASHDIR}/${TN}" "${HOM}/${FNN}"
                    rm "${TRASHDIR}/${TN}"
                fi
            else
                if [[ -f "${FILENAME}" ]];
                then
                    read -p "File \"${FILENAME}\" already exist. Add new name: " NFN
                    ln "${TRASHDIR}/${TN}" "${RDIR}/${NFN}"
                    rm "${TRASHDIR}/${TN}"
                else
                    ln "${TRASHDIR}/${TN}" "${FILENAME}"
                    rm "${TRASHDIR}/${TN}"
                fi
            fi
            sed "/${i}/d" $TRASHLOG > .trash.log2 && mv .trash.log2 $TRASHLOG
            echo "Success!"
            continue
        ;;
        *)
            continue
        ;;
    esac
done