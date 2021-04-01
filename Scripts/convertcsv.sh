#!/bin/bash

echo "paramètres: $*"
echo "paramètres: $@"
echo "nb paramètres: $#"

# verifier qu'on a 2 paramètres exactement
if [ $# -ne 2 ]
then
	echo "nombre de paramètres incorrect (2 attendus)"
	exit -1
fi

FILENAMEIN=$1
FILENAMEOUT=$2

# vérifier que le 1er paramètre est un fichier existant
if [ ! -f "${FILENAMEIN}" ]
then
	echo "le 1er paramètre n'existe pas ou n'est pas un fichier: ${FILENAMEIN}"
	exit -1
fi

# vérifier que le 2e paramètre n'est pas un fichier ou répertoire existant
if [ -e "${FILENAMEOUT}" ]
then
	echo "le fichier de sortie existe déja: ${FILENAMEOUT}"
	exit -1
fi

echo "Fichier entrée : ${FILENAMEIN}"
echo "Fichier sortie : ${FILENAMEOUT}"

# transforme le fichier FILENAMEIN en FILENAMEOUT
cat ${FILENAMEIN} | sed -r -e "s/([^\t]*;[^\t]*)/\"\1\"/g" -e "y/\t/;/" > ${FILENAMEOUT}
