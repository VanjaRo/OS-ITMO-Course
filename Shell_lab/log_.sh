#! /bin/bash

out=/usr/log/anaconda/X.log

if [[ (-f $out) && (-r $out) ]]
then
    sed -n 's/] (WW)/Warning/p' $out > tmp.txt
    sed -n 's/] (II)/Information/p' $out > tmp.txt

    GREP_COLOR="1;33" grep --color="always" "Warning" tmp.txt
    GREP_COLOR="1;34" grep --color="always" "Information" tmp.txt
    rm tmp.txt
else 
    exit 151
fi