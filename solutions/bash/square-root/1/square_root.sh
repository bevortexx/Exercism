#!/bin/bash


number=$1

root=$( echo "sqrt($number)" | bc )
# echo "$root"

if (( $((root * root)) == $number )) ; then
    echo "$root"
    exit 0
else
    echo "ERROR $root"
    exit 1
fi

