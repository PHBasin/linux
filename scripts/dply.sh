#!/bin/bash

FILE=$1

while read SERV
do
	echo "$SERV"
done < $FILE
