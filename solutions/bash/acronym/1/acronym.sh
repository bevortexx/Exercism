#!/bin/bash

words=$#

if (( $words != 1 )) ; then
    echo "Error"
    exit 1
fi

word=$1
size=${#word}
# echo "$size"

if (( $size < 1 )) ; then
    echo "Error"
    exit 1
fi

# echo "$word"
word="${word// - / }"
# echo "La nouvelle chaine est : $word"

word="${word//__Not__/N}"
# echo "La nouvelle chaine est : $word"

word="${word//' * '/' '}"

size=${#word}

result=${word:0:1}

for (( i=1; i<=size ; i++ )) ; do

    letter="${word:i:1}"


    j=$((i-1))
    previous_letter="${word:j:1}"
    

    if [[ "$previous_letter" == " " || "$previous_letter" == "-" ]] ; then
        result+="$letter"
    fi
    
done

result_size=${#result}
# echo "$result_size"
final_result=""

for (( z=0; z<result_size; z++ )) ; do
    temp="${result:$z:1}"
    final_result+="${temp^}"
done

echo "$final_result"