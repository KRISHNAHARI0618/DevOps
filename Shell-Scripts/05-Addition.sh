#!/bin/bash

# Addition Subtraction Multiplication Division

number1=$1
number2=$2
number3=$3

sum=$(( number1 + number2 + number3 ))
sum1=`expr $number1 + $number2 + $number3`
sum2=$(( $number1 + $number2 + $number3 ))

echo $sum
echo $sum1
echo $sum2