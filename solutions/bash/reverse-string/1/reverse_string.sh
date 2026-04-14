#!/usr/bin/env bash
if [ $# = 0 ]; then
        echo "Error : Argument needed"
        echo "Use -> ./script 'argument'"
        exit 1
fi

reverted=""
chain=$1
size=${#1}
i=$size
# echo "Text size : $size letters"
# echo "Text to revert : " $1

i=$((i-1))

while [ $i -ge 0 ]
do
    char=${chain:$i:1}
    reverted=$reverted$char
    i=$((i-1))
done

# echo "Text reverted  : " $reverted
echo "$reverted"
