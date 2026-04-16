#!/bin/bash


flagtable=(false false false false false false false false)
bittable=(1 2 4 8 16 32 64 128)
allergen=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

# Check the allergies score
score=$1
i=0
list=()
instruction=$2

while [ "$i" -lt 8 ] ; do
    if (($score & ${bittable[$i]})) ; then
        #echo "-> ${bittable[$i]}"
        flagtable[$i]="true"
        list+=(${allergen[$i]})
        #echo "${flagtable[$i]}"
    fi
    ((i++))
done
#echo "$list"

# LIST #################################################

if [ "$instruction" == "list" ] ; then
#	echo "${flagtable[*]}"
	echo "${list[*]}"
fi

# ALLERGIC_TO ################################################

if [ "$instruction" == "allergic_to" ] ; then
	i=7
	while [ "$i" -ge 0 ] ; do
		if [[ "${allergen[$i]}" == "$3" ]]  ; then
			echo "${flagtable[$i]}"
			break
		fi
		((i--))
	done
#	echo "false"
fi


