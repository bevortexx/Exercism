#!/bin/bash

nbarg=${#}
value=""
color1=$1
color2=$2

if (( nbarg<2 )) ; then
    echo "invalid color"
    exit 1
fi

listcolor=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")
listvalue=(0 1 2 3 4 5 6 7 8 9)

setvalue(){
    colorfound=0
    for (( i=0 ; i<10 ; i++ )) ; do

        if [[ "$1" == "${listcolor[i]}" ]] ; then 
            value=$value${listvalue[i]}
            colorfound=1
        fi

        # echo "$i ${listcolor[i]} ${listvalue[i]}"
    done

    if (( $colorfound == 0 )) ; then
        echo "invalid color"
        exit 1
    fi
}

setvalue "$color1"
if [[ "$value" == "0" ]] ; then
    value=""
fi

setvalue "$color2"

echo "$value"


