#!/bin/bash
all_com=("calc" "search" "reverse" "strlen" "log" "exit" "help" "interactive")
avaivalable_com=()
unavailable_com=()

for com in ${all_com[@]}; do
if [[ (-f "$com"_.sh) && (-x "$com"_.sh) && (-s "$com"_.sh) ]]
    then 
        avaivalable_com+=( $com )
    else
        unavailable_com+=( $com )
    fi 
done

echo "${avaivalable_com[*]}"