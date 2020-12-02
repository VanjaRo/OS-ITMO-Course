#!/bin/bash
tmp=$(ps x | awk '{printf "%s::%s\n", $1, $5}'| sed '1d')
echo "$tmp" | wc -l > res_i.txt 
echo "$tmp" >> res_i.txt 
