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

for f in ${DIR_IN}/*.jpg
do
	img=${f##*/}
	mkdir -p ${DIR_OUT}/${img:4:8}
	mv ${f} ${DIR_OUT}/${img:4:8}/${img}
done

