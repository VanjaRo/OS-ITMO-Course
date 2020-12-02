#!/bin/bash

sh Lab_4_SubScript.sh & pid0=$!
sh Lab_4_SubScript.sh & pid1=$!
sh Lab_4_SubScript.sh & pid2=$!

renice 10 -p $pid0

top -p $pid0

at now + 20sec <<< "kill ${pid3}"