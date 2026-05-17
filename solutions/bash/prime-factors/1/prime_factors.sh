#!/bin/bash

number=$1
result=""
test=2
bit=1

if (( $number == 1 )) ; then
    echo "$result"
    exit 0
fi

while (( $bit == 1 )) ; do

    if (( $number == $test )) ; then
        result=$result"$test "
        # echo "$number divided by $test = 1 "
        bit=0
        break
    fi

    if (( ($number%$test) == 0 )) ; then
        result=$result"$test "
        number=$((number/test))
    else 
        ((test++))
    fi

    # echo "Test : $test / Result : $result"
done


echo -e "${result% }"