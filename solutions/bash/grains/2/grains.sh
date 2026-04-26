#!/bin/bash

nb=$1

grains_total () {
    printf "%llu\n" -1
    return 0
}

grains_in_cell () {
    local step=$1
    printf "%llu\n" $(( 1 <<  step - 1 )) 
    return 0
}

if [[ "$nb" == "total" ]] ; then
    grains_total
    exit 0
fi

if [[ nb -le 0 || nb -ge 65 ]] ; then
    echo "Error: invalid input"
    exit 1
fi

grains_in_cell "$nb"
exit 0