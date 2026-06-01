#!/bin/bash

arg=$1
cpt=0

if (( $arg == 0 )) ; then
    echo "$cpt"
    exit 0 
fi

continue=1
mod=0
rest=0


while (( continue==1 )) ; do
    if (( ($arg % 2)!=0 )) ; then
        ((cpt++))
    fi

    arg=($arg/2)


    if (( arg<=0 )) ; then
        continue=0
    fi


done


echo "$cpt"

#  _ _ _ _ _ _ _
# |E| |E|E| | |E|
