#!/bin/bash

dna1=$1
dna2=$2
# echo "$dna1 $dna2"

[[ $# -lt 2 ]] 			&& { echo "Usage: hamming.sh <string1> <string2>"; exit 1; }

[[ ${#dna1} != ${#dna2} ]] 	&& { echo "strands must be of equal length"; exit 1; }


hammings=0

for (( i=0; i<${#dna1}; i++ )) do
	[[ "${dna1:$i:1}" != "${dna2:$i:1}" ]] 	&& 	((hammings++))
done

echo "$hammings"
