#! /bin/bash

all_com=( "calc" "search" "reverse" "strlen" "log" "exit" "help" "interactive" )
available_com=()
unavailable_com=()

for com in ${all_com[@]}; do
    if [[ (-f "$com"_.sh) && (-x "$com"_.sh) && (-s "$com"_.sh) ]]
    then 
        available_com+=( $com )
    else
        unavailable_com+=( $com )
    fi 
done 

defined_com=0

for com in ${available_com[@]}; do
    if [[ "$1" -eq "$com" ]]
    then
        ./"$1"_.sh "$2" "$3" "$4"
        defined_com=1
        break
    fi
done

if [[ "$defined_com" -eq 0 ]]
then
    for com in ${unavailable_com[@]}; do
        if [[ "$1" -eq "$com" ]]
        then
            defined_com=1
            echo "This command is now unavailable, try one's from available list:"
            echo "${available_com[*]}"
        fi
    done
fi

if [[ "$defined_com" -eq 0 ]]
then 
    echo "This command undifined at all, try one's from available list:"
    echo "${available_com[*]}"
fi

if [[ "$?" -ne 0 ]]
then 
    case $? in 
        111) echo "calc: wrong number of arguments"
        ;;
        112) echo "calc: wrong type of argument(s)"
        ;;
        113) echo "calc: zero devision error"
        ;;
        114) echo "calc: wrong type of operation"
        ;;
        121) echo "search: wrong number of arguments"
        ;;
        122) echo "search: can't read the file(s)"
        ;;
        123) echo "search: can't access given directory"
        ;;
        131) echo "reverse: wrong number of arguments"
        ;;
        132) echo "reverse: can't access given input file"
        ;;
        133) echo "reverse: can't access given output file"
        ;;
        134) echo "reverse: wrong type of writing to the output"
        ;;
        141) echo "strlen: wrong number of arguments "
        ;;
        151) echo "log: can't access X.log file"
        ;;
        *) echo "Exited with code "$?""
        ;;
    esac
fi
