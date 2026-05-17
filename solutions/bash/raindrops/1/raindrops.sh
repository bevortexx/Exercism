#!/bin/bash

rain=$1
sound=""

if (( ($rain % 3) == 0 )) ; then
    sound=$sound"Pling"
fi

if (( ($rain % 5) == 0 )) ; then
    sound=$sound"Plang"
fi

if (( ($rain % 7) == 0 )) ; then
    sound=$sound"Plong"
fi

if [[ $sound == "" ]] ; then 
    echo "$rain" 
    exit 0
fi

echo "$sound"
