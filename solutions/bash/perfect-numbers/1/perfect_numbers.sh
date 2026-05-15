#!/bin/bash

number=$1

if [[ ! $number =~ ^[0-9]+$ ]] ; then
    echo "Classification is only possible for natural numbers."
    exit 1 
fi

if [[ $number -lt 1 ]] ; then
    echo "Classification is only possible for natural numbers."
    exit 1 
fi

if (( number == 1 )); then
    echo "deficient"
    exit 0
fi

aliquote=1
limit=$(( number / 2 ))

for (( i=2; i*i <= number; i++ )); do
    if (( number % i == 0 )); then
        if (( i*i == number )); then
            (( aliquote += i ))
        else
            (( aliquote += i + (number / i) ))
        fi
    fi
done


if (( aliquote > number )) ; then
    echo "abundant"
elif (( aliquote == number )) ; then
    echo "perfect"
else
    echo "deficient" 
fi