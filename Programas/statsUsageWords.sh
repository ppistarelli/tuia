#!/bin/bash

ORDENADOFILTRADO=$(cat archivo.txt | tr " " "\n" | sort | grep '....' | uniq -c | sort -r)
#echo $ORDENADOFILTRADO
for P in $ORDENADOFILTRADO
do
	echo $P	
done

#echo $TEXTO
#ORDENADO=$($TEXTO | sort | uniq)

