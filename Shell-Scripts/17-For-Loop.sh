#!/bin/bash

var="10 20 30 40 50"

echo "Print All Vars : $var"

for i in {1..10}
do
    echo "$i"
done

for i in $var
do
    echo "$i"
done

servers=" nginx mysql mongodb shell"
for i in $servers
do
    echo "$i"
done

a=10
b=20
c=$(($a+$b))

# c=`expr $a+ expr $b`
echo "$c"

# int a = 0 
# while(a <= 10)
# print(a)
# a = a+1



a=0
# -lt is less than operator
#Iterate the loop until a less than 10
while [ $a -lt 10 ]
do
    # Print the values
    echo $a
    # increment the value
    a=`expr $a + 1`
done