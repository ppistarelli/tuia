#!/bin/bash

PS3="Seleccione el script que desea ejecutar para trabajar sobre el archivo: "
DIRECTORIOBASH="./Programas/"
echo 'Menú de Scripts'
select opcion in "Salir" `ls $DIRECTORIOBASH`
do  
    echo $DIRECTORIOBASH$opcion 
    case $opcion in
        "Salir")
		echo "Hasta Luego"
		break;;
    	*) 	
		if [ -z "$opcion" ]; then echo "Opción inválida"; else bash $DIRECTORIOBASH$opcion; fi
	esac
done 
