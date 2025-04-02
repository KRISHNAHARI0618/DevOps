#!/bin/bash

USERID=$(id -u)

echo $?

echo "${USERID}"

if [ $USERID -ne 0 ]
then
    echo "These Command are executed with in the commands"
else
    echo "Please run with sudo acces"
fi
