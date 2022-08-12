#!/bin/bash
ORACION=""
REGEX='^[.?!]$'
ARCHIVOAUXILIAR="ArchivoAuxiliar.txt"
if [ -e $ARCHIVOAUXILIAR ]
then 
	rm $ARCHIVOAUXILIAR
fi
touch ArchivoAuxiliar.txt
cat archivo.txt | while read LINEA			# Leo el archivo por líneas
do
	CANTLETRASLINEA=$(echo $LINEA | wc -c) 	# Cuento el número de letras que tiene la línea para usarlo en el for
	CANTLETRASLINEA=$(($CANTLETRASLINEA-1))
	
        for INI in $(seq 1 1 $CANTLETRASLINEA)	# Recorro para identificar cada letra y encontrar un fin de oración
        do
		LETRA=$(echo $LINEA | cut -c $INI)
		ORACION=$ORACION$LETRA
		if [[ $LETRA =~ $REGEX ]] 
		then
                       echo $ORACION >> ArchivoAuxiliar.txt
                       ORACION=""
		fi 
        done
done

CANTTOTALDELETRAS=$(cat $ARCHIVOAUXILIAR | wc -c)
LETRASMASCORTA=$CANTTOTALDELETRAS
LETRASMASLARGA=0
MASLARGA=""
CANTORACIONES=0
cat $ARCHIVOAUXILIAR | (while read LINEA			# Leo el archivo por líneas
do
	CANTORACIONES=$((CANTORACIONES + 1))
	CANTLETRASLINEA=$(echo $LINEA | wc -c)
	if [[ $CANTLETRASLINEA -lt $LETRASMASCORTA ]]
	then
		MASCORTA=$LINEA
		LETRASMASCORTA=$CANTLETRASLINEA
	fi
	if [[ $CANTLETRASLINEA > $MASLARGA ]]
	then
		
		MASLARGA=$LINEA
		LETRASMASLARGA=$CANTLETRASLINEA
	fi
	echo $MASCORTA
done 
PROMEDIO=$((CANTTOTALDELETRAS/CANTORACIONES))
echo "La oración mas larga es '$MASLARGA', que tiene $LETRASMASLARGA caracteres (incluyendo la puntuación final)"
echo "La oración mas corta es '$MASCORTA', que tiene $LETRASMASCORTA caracteres (incluyendo la puntuación final)"
echo "El promedio de letras por oración es de $PROMEDIO")
exit 0 
