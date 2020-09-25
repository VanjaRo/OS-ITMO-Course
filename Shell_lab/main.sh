#! /bin/bash

all_com=("calc" "search" "reverse" "strlen" "log" "exit" "help" "interactive")
avaivalable_com=()
unavailable_com=()

for com in ${all_com[@]}; do
    if [[ (-f "$com"_.sh) && (-x "$com"_.sh) && (-s "$com"_.sh) ]]
    then 
        avaivalable_com+=($com)
    else
        unavailable_com=($com)
    fi 
done 

defined_com=0

for com in ${avaivalable_com[@]}; do
    if [[ "$1" -eq "$com" ]]
    then
        echo "`./$1_.sh $2 $3 $4`"
        defined_com=1
        break
    fi
if [[ $defined_com -eq 0]]
then
    for com in ${unavailable_com[@]}; do
        if [[ "$1" -eq "$com" ]]
        then
            defined_com=1
            echo "This command is now unavailable, try one's from available list:"
            echo "${available_com[*]}"
        fi
fi

if [[ $defined_com -eq 0 ]]
then 
    echo "This command undifined at all, try one's from available list:"
    echo "${available_com[*]}"
fi

if [[ $? -ne 0 ]]
then 
    case $? in 
        111) echo ""
        ;;
        112) echo ""
        ;;
        113) echo ""
        ;;
        114) echo ""
        ;;
        121) echo ""
        ;;
        122) echo ""
        ;;
        123) echo ""
        ;;
        124) echo ""
        ;;
        131) echo ""
        ;;
        132) echo ""
        ;;
        133) echo ""
        ;;
        134) echo ""
        ;;
        141) echo ""
        ;;
        151) echo ""
        ;;
        *) echo "Exit with code "$?""