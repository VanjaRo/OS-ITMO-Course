#! /bin/bash

source calc_.sh
source search_.sh
source reverse_.sh
source strlen_.sh
source log_.sh
source exit_.sh
source help_.sh

interactive_(){
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
                    calc_ $funk $x $y
                    break
                ;;
                search)
                    read -p "Dirictory to search in: " dir
                    read -p "String to find: " str
                    search_ $dir $str
                    break
                ;;
                reverse)
                    read -p "File to reverse: " f
                    read -p "Output file name: " of
                    reverse_ $f $of
                    break
                ;;
                strlen)
                    read -p "String to count" str
                    strlen_ $str
                    break
                ;;
                log) 
                    log_
                    break
                ;;
                help)
                    help_
                    break
                ;;
                exit)
                read -p "Code to exit: " extc
                exit_ "$extc"
                break
            ;;
            esac
        done


    done
}