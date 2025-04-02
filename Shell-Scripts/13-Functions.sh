#!/bin/bash

# Validations in shell Scripts
# Functions in shell scripts

#   $? == 0 --> Success
#   $? == 1 - 127 --> Failure/Error

validation(){

    if [ $1 -eq 0 ]
    then
        echo "$2 is Failure"
    else
        echo "$2 is Sucess"
    fi

}

sudo amazon-linux-extras list | grep nginx

validation $? "Nginx Shown"
# 38  nginx1=latest            disabled      [ =stable ]

sudo amazon-linux-extras enable nginx1

validation $? "Enabling Nginx "

# 38  nginx1=latest            enabled      [ =stable ]

sudo yum clean metadata

validation $? "Cleaning the metadata "

sudo yum -y install nginx

validation $? "Installing nginx "

nginx -v

validation $? "Version has shown"

#nginx version: nginx/1.16.1