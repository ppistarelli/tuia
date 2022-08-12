#!/bin/bash

MASCORTA=$(cat archivo.txt | wc -m)
CANTPALABRAS=$(cat archivo.txt | wc -w)
MASLARGA=0
echo "Total de letras " $MASCORTA
echo "Cantidad Palabras " $CANTPALABRAS
PROMEDIO=$((MASCORTA/CANTPALABRAS))
while IFS= read -r linea
do 
	for PALABRA in $linea
	do
		#echo $PALABRA
		CANTLETRAS=${#PALABRA} 
		echo "CantLetras " $CANTLETRAS
		if [[ $CANTLETRAS -lt $MASCORTA ]]
		then
			MASCORTA=$CANTLETRAS
			PALABRACORTA=$PALABRA
		fi 
		if (($CANTLETRAS > $MASLARGA))
		then
			MASLARGA=$CANTLETRAS 
			PALABRALARGA=$PALABRA
		fi  
	done
done < archivo.txt
echo "La palabra mas larga tiene " $MASLARGA " letras, que es '$PALABRALARGA'"
echo "La palabra mas corta tiene " $MASCORTA " letras, que es ' $PALABRACORTA'"
echo "El promedio de letras por palabras es " $PROMEDIO
