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
            case $? in 
                111) echo "calc: wrong number of arguments"
                ;;
                112) echo "calc: wrong type of argument(s)"
                ;;
                113) echo "calc: zero devision error"
                ;;
                114) echo "calc: wrong type of operation"
                ;;
            esac
            sleep 1
	        break
            ;;
            search)
            read -p "Dirictory to search in: " dir
            read -p "String to find: " str
            ./search_.sh "$dir" "$str"
            case $? in 
                121) echo "search: wrong number of arguments"
                ;;
                122) echo "search: can't read the file(s)"
                ;;
                123) echo "search: can't access given directory"
                ;;
            esac
            sleep 1
	        break
            ;;
            reverse)
            read -p "File to reverse: " f
            read -p "Output file name: " of
            ./reverse_.sh "$f" "$of"
            case $? in 
                131) echo "reverse: wrong number of arguments"
                ;;
                132) echo "reverse: can't access given input file"
                ;;
                133) echo "reverse: can't access given output file"
                ;;
                134) echo "reverse: can't access given output file directory"
                ;;
                135) echo "reverse: can't write to the output file"
                ;;
                136) echo "reverse: wrong type of writing to the output"
                ;;
            esac
            sleep 1
	        break
            ;;
            strlen)
            read -p "String to count" str
            ./strlen_.sh "$str"
            case $? in 
                141) echo "strlen: wrong number of arguments "
                ;;
            esac
            sleep 1
	        break
            ;;
            log) 
            ./log_.sh
            case $? in 
                151) echo "log: can't access X.log file"
                ;;
            esac
            sleep 1
	        break
            ;;
            help)
            ./help_.sh
	        break
            ;;
            exit)
            read -p "Code to exit: " extc
            if [[ -z "$extc" ]]
            then 
                exit 0
            elif [[ "$extc" =~ ^-?[0-9]+$ ]]
            then 
                exit "$extc"
            else
                exit 161
            fi
	        break
	    ;;
        esac
    done


done
