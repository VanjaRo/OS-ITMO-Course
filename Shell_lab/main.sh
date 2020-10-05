#! /bin/bash
source calc_.sh
source search_.sh
source reverse_.sh
source strlen_.sh
source log_.sh
source exit_.sh
source help_.sh
source interactive_.sh

# if [[ $# -eq 0 ]]
# then 
#     exit 100
# fi

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
ext_c=0

for com in ${available_com[@]}; do
    if [[ ("$1" -eq "$com") && (-n "$1") ]]
    then
        case $1 in
            calc) calc_ "${@:2}";;
            search) search_ "${@:2}";;
            reverse) reverse_ "${@:2}";;
            strlen) strlen_ "${@:2}";;
            log) log_;;
            exit) exit_ "${@:2}";;
            help) help_;;
            interactive) interactive_;;
        esac
	    ext_c=$?
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

exit "$ext_c"

# if [[ "$ext_c" -ne 0 ]]
# then 
#     case $ext_c in 
#         111) echo "calc: wrong number of arguments"; exit 111
#         ;;
#         112) echo "calc: wrong type of argument(s)"; exit 112
#         ;;
#         113) echo "calc: zero devision error"; exit 113
#         ;;
#         114) echo "calc: wrong type of operation"; exit 114
#         ;;
#         121) echo "search: wrong number of arguments"; exit 121
#         ;;
#         122) echo "search: can't read the file(s)"; exit 122
#         ;;
#         123) echo "search: can't access given directory"; exit 123
#         ;;
#         131) echo "reverse: wrong number of arguments"; exit 131
#         ;;
#         132) echo "reverse: can't access given input file"; exit 132
#         ;;
#         133) echo "reverse: can't access given output file"; exit 133
#         ;;
#         134) echo "reverse: can't access given output file directory"; exit 134
#         ;;
#         135) echo "reverse: can't write to the output file"; exit 135
#         ;;
#         136) echo "reverse: wrong type of writing to the output"; exit 136
#         ;;
#         141) echo "strlen: wrong number of arguments "; exit 141
#         ;;
#         151) echo "log: can't access X.log file"; exit 151
#         ;;
#         *) echo "Exited with code: "$ext_c""; exit
#         ;;
#     esac
# fi
