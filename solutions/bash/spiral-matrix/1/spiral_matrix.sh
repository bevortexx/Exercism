#!/bin/bash

number=$1


if (( $number < 0 )) ; then
    echo "ERROR"
    exit 1
fi

if (( $number == 1 )) ; then
    echo "1"
    exit 0
fi

# DEPENDING ON THE WAY MOVE TO THE NEXT POSITION IN THE SPIRALE
moveX(){
    local direction="$1"
    local tracker=$2
    local new_position=0

    if [[ "$direction" == "R" ]] ; then
        new_position=$((tracker + 1))

    elif [[ "$direction" == "D" ]] ; then
        new_position=$((tracker))

    elif [[ "$direction" == "L" ]] ; then
        new_position=$((tracker - 1))

    elif [[ "$direction" == "U" ]] ; then
        new_position=$((tracker))
    fi
    
    echo "$new_position"
}

# DEPENDING ON THE WAY MOVE TO THE NEXT POSITION IN THE SPIRALE
moveY(){
    local direction="$1"
    local tracker=$2
    local new_position=0

    if [[ "$direction" == "R" ]] ; then
        new_position=$((tracker))

    elif [[ "$direction" == "D" ]] ; then
        new_position=$((tracker + 1))

    elif [[ "$direction" == "L" ]] ; then
        new_position=$((tracker))

    elif [[ "$direction" == "U" ]] ; then
        new_position=$((tracker - 1))

    fi

    echo "$new_position"
}
# CHANGE THE DIRECTION OF THE WRITING WAY
changedirection(){
    local dir=$1
    if [[ "$dir" == "R" ]] ; then
        echo "D"
        
    elif [[ "$dir" == "D" ]] ; then
        echo "L"
        
    elif [[ "$dir" == "L" ]] ; then
        echo "U"
        
    elif [[ "$dir" == "U" ]] ; then
        echo "R"
        
    fi
}


square=$((number*number))
root=$((number*number))

# FIRST DIRECTION ALWAYS RIGHT
way="R"

# MATRIX CREATION
declare -A matrix
x=0
y=0


# FILL THE MATRIX WITH O #############
while (( x<number )) ; do
    y=0
    while (( y<number )) ; do
        matrix["$x","$y"]="0"
        ((y++))
    done

    ((x++))
done

# CHECK THE INITIALISATIO OF THE MATRIX
# echo "${matrix[@]}"



# WRITE THE FIRST ELEMENT OF THE TABLE
# matrix[$x,$y]="$script"

# DECLARE THE SIDE_LIMIT & THE SIDE_POSITION
limit=$((number))
# echo "LIMIT : $limit"
posMeter=0

# FLAG to CHECK IF 1st LINE
firstLINE=1

# FLAG to CHECK 2 SIDES (or TIMES) WRITINGS
doublewriting=0

# RESET OF PARAMETERS
x=0
y=0
looper=1

# FILL THE MATRIX WITH NUMBERS UNTIL SQUARE
while (( $looper <= $square )) ; do
    
    if (( firstLINE == 1 )) ; then
        ((limit--))
        firstLINE=0
    fi
    

    # ((script++))

    # WRITE IN THE POSITION
    matrix["$y","$x"]="$looper"
    # echo "WAY $way [X,Y]: [$x,$y]    LOOPER VALUE: $looper       MATRIX ${matrix[$x,$y]}"

    

    

    # CHECK THE LIMIT THEN CHANGE DIRECTION IF LIMIT REACHED 
    if (( posMeter == limit )) ; then
        way=$(changedirection $way)
        posMeter=0
        
        if ((doublewriting == 0)) ; then 
            ((limit--))
            doublewriting=1
        else
            doublewriting=0
        fi

    else 
        ((posMeter++))
    fi

    # MOVE TO THE NEXT POSITION
    x=$(moveX $way $x)
    y=$(moveY $way $y)

    ((looper++))

done

# echo "${matrix[@]}"

result=""

for (( i=0; i<number; i++)) ; do 

    for (( j=0; j<number; j++ )) ; do

        if (( j == 0 )); then
            result+="${matrix[$i,$j]}"
        else
            result+=" ${matrix[$i,$j]}"
        fi

    done 
    result+="\n"
    
done 




echo -e "$result"