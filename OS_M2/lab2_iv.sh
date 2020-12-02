
#!/bin/bash

result=''
for pid in $(ps -A -o pid --no-headers)
do
        # se.sum_exec_runtime
        runtime=$(cat /proc/$pid/sched | head -n5 | tail -n1 | cut -d ':' -f2| sed 's/\s*//' )
        switches=$(cat /proc/$pid/sched | head -n7 | tail -n1 | cut -d ':' -f2| sed 's/\s*//' )
        ppid=$(cat /proc/$pid/status | head -n7 | tail -n1 | cut -d ':' -f2 | sed 's/\s*//')
        if [[ $ppid != "" ]]
        then
                result=$result"ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Time="$( echo $runtime $switches| awk '{print $1/$2}')"\\n"
        fi
done
echo -e $result | sort -n -t ':' -k2.19| tail -n +2 > res_iv.txt
~                                                                                 
