#! /bin/bash

all_com=("calc" "search" "reverse" "strlen" "log" "help" "exit")
avaivalable_com=()

for com in ${all_com[@]}; do
    if [[ (-f "$com"_.sh) && (-x "$com"_.sh) && (-s "$com"_.sh) ]]
    then 
        avaivalable_com+=($com)
    fi 
done 


if [[ $defined_com -eq 0 ]]
then 
    echo "This command undifined at all, try one's from available list:"
    echo "${available_com[*]}"
fi


# while true
# do 
select com in ${all_commands[*]}
do
    case $com in 
        calc) 
        read -p "Operation name (sum/sub/mul/div): " funk
        read -p "First operand: " x
        read -p "Second operand: " y
        echo "`./calc_.sh "$funk" "$x" "$y"`"
        ;;
        search)
        read -p "Dirictory to search in: " dir
        read -p "String to find: " str
        echo "`./search_.sh "$dir" "$str"`"
        ;;
        reverse)
        read -p "File to reverse: " f
        read -p "Output file name: " of
        echo "`./reverse_.sh "$f" "$of"`"
        ;;
        strlen)
        read -p "String to count" str
        echo "`./strlen_.sh "$str"`"
        ;;
        log) 
        echo "`./log_.sh`"
        ;;
        help)
        echo "`./help_.sh`"
        ;;
        exit)
        read -p "Code to exit: " extc
        echo "`./exit.sh "$extc"`"
    esac
done


# done