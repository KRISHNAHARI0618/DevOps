#!/bin/bash

echo -n "Please Insert your input : "

while read line
do
    echo $line | wc -m
    exit 1
done