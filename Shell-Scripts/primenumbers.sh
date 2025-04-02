#!/bin/bash

# Function to check if a number is prime

is_prime() {
    local num=$1
    if [ $num -lt 2 ]; then
        return 1 # Not prime
    fi

    for (( i=2; i*i<=$num; i++ )); do
        if [ $((num%i)) -eq 0 ]; then
            return 1 # Not prime
        fi
    done

    return 0 # Prime
}

#This is my Second File
# Get user input for the range
echo -n "Enter the range (e.g., 1 100): "
read start end

# Print prime numbers in the given range
echo "Prime numbers in the range $start to $end are:"
for (( num=$start; num<=$end; num++ )); do
    if is_prime $num; then
        echo $num
    fi
done
