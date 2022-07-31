#!/bin/bash
MASCORTA=$(cat archivo.txt | wc -m)
CANTPALABRAS=$(cat archivo.txt | wc -w)
MASLARGA=0
echo "Total de letras " $MASCORTA
echo "Cantidad Palabras " $CANTPALABRAS
PROMEDIO=$((MASCORTA/CANTPALABRAS))
while IFS= read -r linea
do 
	for palabra in $linea
	do
		#echo $palabra
		CANTLETRAS=${#palabra} 
		#echo "CantLetras " $CANTLETRAS
		if (($CANTLETRAS < $MASCORTA))
		then
			MASCORTA=$CANTLETRAS
		fi
		if (($CANTLETRAS > $MASLARGA))
		then
			MASLARGA=$CANTLETRAS 
		fi  
	done
done < archivo.txt
echo "La palabra mas larga tiene " $MASLARGA " letras"
echo "La palabra mas corta tiene " $MASCORTA " letras"
echo "El promedio de letras por palabras es " $PROMEDIO
