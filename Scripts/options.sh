#!/bin/bash

# FORCE=0 don't force overwrite, FORCE=1 force overwrite
FORCE=0
DELIMITER_IN='\t'

while [ $# -gt 2 ]
do
	echo "args: $@"
	case "$1" in
		-f) 	FORCE=1
			echo "option -f activée";;
		-di) 	shift
			DELIMITER_IN=$1
			echo "option -di activée";;
	esac
	shift
done

echo "Force mode: ${FORCE}"
echo "Delimiter input file: ${DELIMITER_IN}"
echo "args: $@"
echo "1st arg: $1"
