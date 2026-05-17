#!/bin/bash

nbarg=${#}
proverb=""

if (( $nbarg == 0 )) ; then
    echo "$proverb"
    exit 0
fi

for (( i=1 ; i<nbarg ; i++ )) ; do
    j=$((i+1))
    proverb=$proverb"For want of a ${!i} the ${!j} was lost.
"
    # echo "${#i}"
done

proverb=$proverb"And all for the want of a $1."

echo "$proverb"

