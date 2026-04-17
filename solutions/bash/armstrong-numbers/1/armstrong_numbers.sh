#!/usr/bin/env bash

#!/bin/bash


number=$1


if [[ $number -lt 0 ]] ; then
    exit
    echo    "wrong number"
fi

index=${#number}
boucle=$(( $index-1 ))
calculus=0


while [[ $boucle -ge 0 ]] ; do
    chiffre=${number:$boucle:1}
#    echo    "$boucle et chiffre a monter en puissance : $chiffre"
    tempsum=$(( chiffre ** index ))
    calculus=$(( calculus + tempsum ))
#    echo    "sum : $calculus"
    boucle=( $boucle-1 )
done


if [[ $calculus != $number ]] ; then
    echo "false"
    exit
fi

echo "true"
