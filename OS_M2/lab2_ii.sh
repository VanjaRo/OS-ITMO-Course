#!/bin/bash
ps axu | awk '{print $11, $2}' | grep '/sbin'| awk '{print $2}' > res_ii.txt 
