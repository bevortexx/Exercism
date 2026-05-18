#!/bin/bash

nbarg=${#}


if (( nbarg<2 )) ; then
    echo "invalid color"
    exit 1
fi

value=""
color1=$1
color2=$2
color3=$3

listcolor=("black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white")
listvalue=(0 1 2 3 4 5 6 7 8 9)
listohms=(" ohms" "0 ohms" "00 ohms" " kiloohms" "0 kiloohms" "00 kiloohms" " megaohms" "0 megaohms" "00 megaohms" " gigaohms")

if [[ $color1 == "black" &&  $color2 == "black" &&  $color3 == "black" ]] ; then
    echo "0 ohms"
    exit 0
fi    

for color in "$color1" "$color2" "$color3"; do
    if [[ ! " ${listcolor[*]} " =~ " $color " ]]; then
        echo "invalid color"
        exit 1
    fi
done


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
if [[ "$value" == "0" && $color2 != "black" ]] ; then
    value=""
fi

setvalue "$color2"

ohms=0

# setvalue "$color3"
for (( j=0 ; j<10 ; j++ )) ; do
    
    if [[ "$color3" == "${listcolor[j]}" ]] ; then 
            ohms=${listvalue[j]}
    fi

done

if [[ $color2 == "black" ]] ; then
        value=${value%?}
        echo "$value${listohms[$ohms+1]}"
        exit 0
fi

echo "$value${listohms[$ohms]}"


