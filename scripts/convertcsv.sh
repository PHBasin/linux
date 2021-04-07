#!/bin/bash

# ----------------------------------
# gestion des options
# ----------------------------------

# FORCE=0 don't force overwrite, FORCE=1 force overwrite
FORCE=0
DELIMITER_IN='\t'
QUOTE_OUT='"'

while [ $# -gt 2 ]
do
	echo "args: $@"
	case "$1" in
		-f) 	FORCE=1
					echo "option -f activée";;
		-di) 	shift
					DELIMITER_IN=$1
					echo "option -di activée";;
		-do)	shift
					DELIMITER_OUT=$1
					echo "option -do activée";;
		-qi)	shift
					QUOTE_IN=$1
					echo "option -qi activée";;
		-qo)	shift
					QUOTE_OUT=$1
					echo "option -qo activée";;
		*) 		echo "option inconnue : $1"
					exit -1;;
	esac
	shift
done

echo "------ RECAP -----"
echo "Force mode: ${FORCE}"
echo "Delimiter input file: ${DELIMITER_IN}"
echo "Delimiter output file: ${DELIMITER_OUT}"

if [ ! -z ${QUOTE_IN} ]
then
	echo "Quote in: ${QUOTE_IN}"
fi

if [ ! -z ${QUOTE_OUT} ]
then
	echo "Quote out: ${QUOTE_OUT}"
fi

# ----------------------------------
# conversion fichier1 => fichier2
# ----------------------------------
echo "------ PARAMS ------"
echo "Files: $@"
echo "Nb files: $#"

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
if [ -e "${FILENAMEOUT}" -a ${FORCE} -eq 0 ]
then
	echo "le fichier de sortie existe déja: ${FILENAMEOUT}"
	exit -1
elif [ -e "${FILENAMEOUT}" -a ${FORCE} -eq 1 ]
then
	rm ${FILENAMEOUT}
fi

echo "Fichier entrée : ${FILENAMEIN}"
echo "Fichier sortie : ${FILENAMEOUT}"

# transforme le fichier FILENAMEIN en FILENAMEOUT
# cat ${FILENAMEIN} | sed -r -e "s/([^\t]*;[^\t]*)/\"\1\"/g" -e "y/\t/;/" > ${FILENAMEOUT}
cat ${FILENAMEIN} | sed -r -e "s/([^${DELIMITER_IN}]*${DELIMITER_OUT}[^${DELIMITER_IN}]*)/${QUOTE_OUT}\1${QUOTE_OUT}/g" -e "y/${DELIMITER_IN}/${DELIMITER_OUT}/" > ${FILENAMEOUT}

# remplacer quotes_in par quotes_out
if [ -z ${QUOTE_IN} ]
then
	sed "s/${QUOTE_IN}/${QUOTE_OUT}/g"
fi

