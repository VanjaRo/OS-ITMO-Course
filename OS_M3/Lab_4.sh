#!/bin/bash

sh Lab_4_SubScript.sh & pid0=$!
sh Lab_4_SubScript.sh & pid1=$!
sh Lab_4_SubScript.sh & pid2=$!

renice 10 -p $pid0

at now + 1 minute <<< kill $pid0
at now + 2 minute <<< kill $pid1 $pid2
