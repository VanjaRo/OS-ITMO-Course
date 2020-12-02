#!/bin/bash

mkdir ~/test && (echo '['$(date)']' "catalog test was created successfully" > ~/report; touch ~/test/`date +"%Y-%m-%d_%H:%M:%S"`) 
ping net_nikogo.ru -c 1 || echo '['$(date)']' "net_nikogo.ru is unreachable" >> ~/report