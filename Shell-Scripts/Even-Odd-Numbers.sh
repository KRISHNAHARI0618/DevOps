#!/bin/bash

echo "Enter a number:"
read number
if [ $number -eq 0 ]; then
    echo "The number is zero."
elif [ $((number % 2)) -eq 0 ]; then
    echo "The number is even."
else
    echo "The number is odd."
fi 

for i in {1..10}
do
    if [ $((i % 2)) -eq 0 ]; then
        echo "$i is even"
    else
        echo "$i is odd"
    fi
done 

while [ $number -gt 0 ]
do
    if [ `expr $number % 2` == 0 ]; then
        echo "$number is even"
    else
        echo "$number is odd"
    fi
    number=$((number - 1))
done
echo "All numbers are processed."