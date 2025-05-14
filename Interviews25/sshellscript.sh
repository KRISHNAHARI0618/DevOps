#!/bin/bash

# grep -vE "image" |

# find . -type f -name "*.yaml" -exec 

# File if it is file echo file 

# path=$(pwd)

for path in *;
do 
    if [ -f "$path" ];
    then
        echo "$path is File"
    elif [ -d $path ];
    then 
        echo "$path is Directory"
    else
        echo "$path is Neither Directory Nor File"
    fi
done