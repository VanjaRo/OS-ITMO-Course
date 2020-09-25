#! /bin/bash

all_com=("calc" "search" "reverse" "strlen" "log" "help" "exit")
available_com=()

for com in ${all_com[@]}; do
    if [[ (-f "$com"_.sh) && (-x "$com"_.sh) && (-s "$com"_.sh) ]]
    then 
        available_com+=($com)
    fi 
done 


while true; do 
    select com in ${available_com[*]}
    do
        case $com in 
            calc)
            read -p "Operation name (sum/sub/mul/div): " funk
            read -p "First operand: " x
            read -p "Second operand: " y
            ./calc_.sh "$funk" "$x" "$y"
            ;;
            search)
            read -p "Dirictory to search in: " dir
            read -p "String to find: " str
            ./search_.sh "$dir" "$str"
            ;;
            reverse)
            read -p "File to reverse: " f
            read -p "Output file name: " of
            ./reverse_.sh "$f" "$of"
            ;;
            strlen)
            read -p "String to count" str
            ./strlen_.sh "$str"
            ;;
            log) 
            ./log_.sh
            ;;
            help)
            ./help_.sh
            ;;
            exit)
            read -p "Code to exit: " extc
            ./exit.sh "$extc"
	    ;;
        esac
    done


done
