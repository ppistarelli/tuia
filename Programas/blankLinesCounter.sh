#!/bin/bash

LINEAENBLANCO='^$'
CANTLINEASENBLANCO=0

while IFS= read -r LINEA
do 
	if [[ $LINEA =~ $LINEAENBLANCO ]]
	then
		CANTLINEASENBLANCO=$((CANTLINEASENBLANCO + 1 ))
	fi
done < archivo.txt
echo "Hay $CANTLINEASENBLANCO lineas en blanco"
