#!/bin/bash

if (( $# != 1 )) ; then
    echo "ERROR"
    exit 1
fi

word=$1
length=${#word}
score=0

for (( i=0 ; i<length ; i++ )) ; do
    lettre=${word:i:1}
    # echo "$lettre"

    case "$lettre" in 
        "A" | "a" | "E" | "e" | "I" | "i" | "O" | "o" )
            ((score+=1))
            ;;    
        "U" | "u" | "L" | "l" | "N" | "n" | "R" | "r" | "S" | "s" | "T" | "t")
            ((score+=1))
            ;;
        "D" | "d" | "G" | "g")
            ((score+=2))
            ;;
        "B" | "b" | "C" | "c" | "M" | "m" | "P" | "p")
            ((score+=3))
            ;;
        "F" | "f" | "H" | "h" | "V" | "v" | "W" | "w" | "Y" | "y")
            ((score+=4))
            ;;
        "K" | "k")
            ((score+=5))
            ;;
        "J" | "j" | "X" | "x")
            ((score+=8))
            ;;
        "Q" | "q" | "Z" | "z")
            ((score+=10))
            ;;
    esac

done

echo "$score"