#! /bin/bash
calc_() {
	if [[ $# -lt 3 ]]
	then 
		echo "calc: wrong number of arguments" >&2; return 111
	fi

	if ! [[ ("$2" =~ ^-?[0-9]+$) && ("$3" =~ ^-?[0-9]+$) ]]
	then 
		echo "calc: wrong type of argument(s)" >&2; return 112
	fi

	case "$1" in
		sum) echo "$[$2 + $3]"
		;;
		sub) echo "$[$2 - $3]"
		;;
		mul) echo "$[$2 * $3]"
		;;
		div) if [[ "$3" -eq 0 ]]; then 
			echo "calc: zero devision error" >&2; return 113
			else
				echo "$[ $2 / $3 ]"
			fi
		;;
		*) echo "calc: wrong type of operation" >&2; return 114
	esac

}