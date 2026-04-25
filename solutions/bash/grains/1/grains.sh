#!/bin/bash

nb=$1

if [[ nb -eq 1 ]] ; then
    echo "1"
    exit 0
fi

if [[ "$nb" == "total" ]] ; then
    echo "18446744073709551615"
    exit 0
fi

if [[ nb -le 0 || nb -ge 65 ]] ; then
    echo "Error: invalid input"
    exit 1
fi

i=1
total=1
sum=0

while [[ $i -lt $nb ]] ; do
#    echo "Sur la case $i nombre de grains : $total"
    total=$(echo "$total * 2" | bc)
    ((i++))
done

echo "$total"