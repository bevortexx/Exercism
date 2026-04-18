#!/bin/bash

number=$2


if [[ number -lt 0 ]] ; then
    exit
fi

square=0
sum=0

i=$2

while [[ $i -ge 0 ]] ; do
    square=$(( square + ( i * i ) ))
    sum=$(( sum + i ))
    ((i--))
done

sum=$(( sum * sum ))

#echo "$squaresum"
#echo "$sumsquare"


ok="true"
ko="false"
argu=$1

if [[ $argu == "square_of_sum" ]] ; then
    echo    "$sum"
    exit
fi


if [[ $argu ==  "sum_of_squares" ]] ; then
    echo    "$square"
    exit
fi


if [[ $argu ==  "difference" ]] ; then
    diff=$(( sum - square ))
    echo    "$diff"
    exit
fi

