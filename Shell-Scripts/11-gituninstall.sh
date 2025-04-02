#!/bin/bash

#Un Install Git 

userid=$(id -u)

echo "The command is ${userid}"

sudo yum remove git -y 

if [ $? -ne 0 ]
then
    echo "uninstalled git is success"
else
    echo "Uninstalled git is not success"
fi
