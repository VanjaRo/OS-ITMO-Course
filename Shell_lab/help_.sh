#! /bin/bash

printf " 
Usage without interaction mode on:
./main.sh program arg1 arg2 arg3
Types of programs available:
****
calc FUNKTION_TYPE ARG1 ARG2
--
FUNTION_TYPE could be:
} sum for +
} sub for -
} mul for *
} div for /
****
search DIR PATTERN
--
DIR - directory to search in
PATTERN - regular expression 
****
reverse INPUT_F OUTPUT_F
--
INPUT_F - file to reverse
OUTPUT_F - destination of the reversed text
****
strlen STR
--
STR - string to check amount of symbols in
****
log
--
Outputting X.log file to your command prompt with colored Warning and Information signs
****
exit EXIT_CODE=0
--
Exiting propram with a specified EXIT_CODE or 0
****
interactive
--
Entering an interactive mode with a menu
****
help
--
Outputting this lines of text to your command prompt

****
Exit codes: 

100 - main: no arguments were passed to main

111 - calc: wrong number of arguments

112 - calc: wrong type of argument(s)

113 - calc: zero devision error

114 - calc: wrong type of operation

121 - search: wrong number of arguments

122 - search: can't read the file(s)

123 - search: can't access given directory

131 - reverse: wrong number of arguments

132 - reverse: can't access given input file

133 - reverse: can't access given output file

134 - reverse: wrong type of writing to the output

141 - strlen: wrong number of arguments 

151 - log: can't access X.log file
"
