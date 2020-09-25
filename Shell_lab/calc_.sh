#! /bin/bash

if [[ $# -lt 3 ]]
then 
	exit 111
fi

if ! [[ ($2 =~ ^-?[0-9]+$) || ($3 =~ ^-?[0-9]+$) ]]
then 
	exit 112
fi

case "$1" in
	sum) echo "$[$2 + $3]"
	;;
	sub) echo "$[$2 - $3]"
	;;
	mul) echo "$[$2 * $3]"
	;;
	div) [[ "$3" -eq 0 ]] && exit 113 || echo "$[ $2 / $3 ]"
	;;
	*) exit 114
esac

