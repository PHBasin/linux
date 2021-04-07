#!/bin/bash

for f in RepoGithub/Photos/Set1/*.jpg
do
	echo "Un fichier image: $f"
done

for p in $@
do
	echo "paramètre : $p"
done
