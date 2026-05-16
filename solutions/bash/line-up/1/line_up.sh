#!/bin/bash

name=$1
number=$2
part="th"

case "$number" in
    *11|*12|*13)
        # part="th"
        ;;
    *1)
        part="st"
        ;;
    *2)
        part="nd"
        ;;
    *3)
        part="rd"
        ;;
    *)
        part="th"
        ;;
esac


echo "$name, you are the $number$part customer we serve today. Thank you!"

