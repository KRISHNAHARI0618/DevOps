#!/bin/bash

usage=$(df -h)

grep "use" | 
find -i / | sort "$usage -gt 90" | 
if [ $usage -gt 90 ] 
then
    echo "The email Will be triggered"

fi

#Write a script to check disk usage and send an email alert if it exceeds 90%.