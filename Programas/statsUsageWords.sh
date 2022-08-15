#!/bin/bash

ORDENADOFILTRADO=$(cat archivo.txt | tr " " "\n" | tr -d '.' | tr -d ',' | tr -d '?' | sort | grep '....' | uniq -i -c | sort -r)
I=0
for P in $ORDENADOFILTRADO
do
	if (($I == 20))
	then
		break
	else
	echo $P
	I=$((I+1))
	fi 	
done


