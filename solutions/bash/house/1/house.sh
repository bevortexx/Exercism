#!/bin/bash

if [[ $# == 0 || $# -gt 2 ]] ; then
	echo "invalid" 
	exit 1
elif [[ $1 -lt 1 || $1 -gt 12 ]] ; then
	echo "invalid" 
        exit 1
elif [[ $2 -lt 1 || $2 -gt 12 ]] ; then
        echo "invalid" 
        exit 1
fi


table=("This is the house that Jack built.")

table+=("This is the malt
that lay in the house that Jack built.") 

table+=("This is the rat
that ate the malt
that lay in the house that Jack built.")

table+=("This is the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.") 

table+=("This is the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.") 

table+=("This is the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.") 

table+=("This is the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.")

table+=("This is the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.")

table+=("This is the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.") 

table+=("This is the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.")

table+=("This is the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.")

table+=("This is the horse and the hound and the horn
that belonged to the farmer sowing his corn
that kept the rooster that crowed in the morn
that woke the priest all shaven and shorn
that married the man all tattered and torn
that kissed the maiden all forlorn
that milked the cow with the crumpled horn
that tossed the dog
that worried the cat
that killed the rat
that ate the malt
that lay in the house that Jack built.")

# echo "${table[@]}"

result=""

for (( i=$1-1 ; i<$2 ; i++ )); do
	result+="${table[$i]}\n\n"
done

echo -e -n "$result"