#!/bin/bash

if (( $# != 2)) ; then
    echo "ERROR"
    exit 1
fi

string=$1
digit=$2
stringL=${#string}

if [[ "$string" == "" ]] ; then
    echo "series cannot be empty"
    exit 1
fi

if (( $string < 1 )) ; then
    echo "slice length cannot be greater than series length"
    exit 1
fi

if (( $digit == 0 )) ; then
    echo "slice length cannot be zero"
    exit 1
fi

if (( $digit >  $stringL )) ; then
    echo "slice length cannot be greater than series length"
    exit 1
fi

if (( $digit < 0 )) ; then
    echo "slice length cannot be negative"
    exit 1
fi

result=""

for (( x=0 ; $(( x + digit )) <= $stringL ; x++ )) ; do

    loop=0

    while (( $loop < $digit )) ; do
        display=$((x+loop))
        dig=${string:display:1}
        result+="$dig"
        # echo "LOOP{ $loop } and DIG : $dig and RESULT : $result"
        ((loop++))
    done

    result+=" "

done

echo -e "${result% }"





