#!/bin/bash

if (( $# != 1 )) ; then
    echo "ERROR"
    exit 1
fi

number=$1


if (( $number < 2 )) ; then
    # echo "no primes under two"
    exit 0
fi

excluded=()
list_prime=""

for (( i=2; i<=number ; i++ )) ; do

    bit_exclusion=0

    for x in "${excluded[@]}" ; do
        if [[ "$x" -eq "$i" ]]; then
            bit_exclusion=1
            break
        fi 
    done
    
    if [[ $bit_exclusion -eq 0 ]]  ; then
        list_prime="$list_prime$i "
        multi=0
        for (( e=i ; multi<=number ; e++ )) ; do
            multi=$(( e * i ))
            excluded+=($multi)
        done
    fi

done

printf "${list_prime%?}"
exit 0