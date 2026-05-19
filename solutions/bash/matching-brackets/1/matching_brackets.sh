#!/bin/bash

if (( $# != 1 )) ; then 
    echo "ERROR"
    exit 1
fi

length=${#1}
string=$1

pile=()

#   echo "${pile[0]}"


for (( a=0 ; a<length ; a++ )) ; do
    
    # echo "${string:a:1}"

    # Check for ( { [ : if yes => stock on the pile 
    if [[ "${string:a:1}" == "(" || "${string:a:1}" == "{" || "${string:a:1}" == "[" ]] ; then
        pile+=("${string:a:1}")
    fi

    # Check for )
    if [[ "${string:a:1}" == ")" ]] ; then
        if (( ${#pile[@]} == 0 )) || [[ "${pile[-1]}" != "(" ]] ; then
            echo "false"
            exit 0
        else
            unset "pile[-1]"    
        fi
    fi

    # Check for }
    if [[ "${string:a:1}" == "}" ]] ; then
            if (( ${#pile[@]} == 0 )) || [[ "${pile[-1]}" != "{" ]] ; then
            echo "false"
            exit 0
        else
            unset "pile[-1]"    
        fi
    fi

    # Check for ]
    if [[ "${string:a:1}" == "]" ]] ; then
            if (( ${#pile[@]} == 0 )) || [[ "${pile[-1]}" != "[" ]] ; then
            echo "false"
            exit 0
        else
            unset "pile[-1]"    
        fi   
    fi
done

if (( ${#pile[@]} == 0 )) ; then
    echo "true"
    exit 0
else
    echo "false"
    exit 0
fi


# # Instructions
# # Given a string containing brackets [], braces {}, parentheses (), 
# # or any combination thereof, verify that any and all pairs are matched and nested correctly. 
# # Any other characters should be ignored. 
# # For example, "{what is (42)}?" is balanced and "[text}" is not.
