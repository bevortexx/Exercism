#!/bin/bash


if [[ $# != 2 ]] ; then
    echo "ERROR"
    exit 1
fi

serie=$1
length=${#1}
span=$2

if [[ $length -lt $span ]] ; then
    echo "span must not exceed string length"
    exit 1
fi

if [[ $span -lt 0 ]] ; then
    echo "span must not be negative"
    exit 1
fi

best=0
maxmulti=0
# walk through the serie
for (( i=0; i < length; i++ ))
do  
    actual=$(( i + span ))
    if [[ $actual -le $length ]] ; then

        serie2=${serie:i:span}
        multi=1

        for (( j=0 ; j<span ; j++)) ; do
            digit=${serie2:j:1}
            if [[ $digit != [0-9] ]] ; then
                echo "input must only contain digits"
                exit 1
            fi
            multi=$(( $multi * $digit ))

        done
        if [[ $multi -gt $maxmulti ]] ; then
                maxmulti=$multi
                best=$serie2
        fi
    fi
    
done    
echo "$maxmulti"