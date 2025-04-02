#!/bin/bash

#conditions are used to check one is correct or wrong
# if ture write this else write another 
number=$1

if [ $number -gt 10 ]
then
    echo "My ${number} is greater than 10 Number"
else
    echo "My ${number} is lesser than 10 Number"
fi 

number2=$2
