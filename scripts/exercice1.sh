#!/bin/bash

REPO_SRC=$1
REPO_DST=$2

if [ $# -ne 2 ]
then
	echo "nombre d'arguments invalide"
	exit -1
fi

if [ ! -d ${REPO_SRC} -o ! -d ${REPO_DST} ]
then
	echo "source ou destination incorrecte"
	exit -2
fi

echo "$1"
echo "$2"

mv $REPO_SRC*.jpg $REPO_DST 
