#!/bin/bash

if [ $# -ne 2 ] 
then
	echo "nombre de paramètres insuffisant (attendu 2, fourni $#)"
	exit -1
fi

DIR_IN=$1
DIR_OUT=$2

if [ ! -d "${DIR_IN}" -o ! -d "${DIR_OUT}" ]
then
	echo "un paramètre fourni n'est pas un répertoire"
	exit -1
fi

mv ${DIR_IN}/*.jpg ${DIR_OUT}
