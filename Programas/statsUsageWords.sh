#!/bin/bash

ORDENADOFILTRADO=$(cat archivo.txt | tr " " "\n" | tr -d '.' | tr -d ',' | sort | grep '....' | uniq -i -c | sort -r)
I=0
for P in $ORDENADOFILTRADO
do
	if (($I > 10))
	then
		break
	else
	echo $P
	fi	
done


