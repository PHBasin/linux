#!/bin/bash

echo "paramètres: $*"
echo "paramètres: $@"
echo "nb paramètres: $#"

FILENAMEIN=$1
FILENAMEOUT=$2

echo "Fichier entrée : ${FILENAMEIN}"
echo "Fichier sortie : ${FILENAMEOUT}"

# transforme le fichier FILENAMEIN en FILENAMEOUT
cat ${FILENAMEIN} | sed -r -e "s/([^\t]*;[^\t]*)/\"\1\"/g" -e "y/\t/;/" > ${FILENAMEOUT}
