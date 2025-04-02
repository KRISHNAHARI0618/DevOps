#!/bin/bash

# read command should be used to take the input variables

echo "Please enter your name "

read username

echo "My Name is $username"

# Securing the Pasword using -s to the read command 

echo "Please enter password"

read -s password

echo "I have entered the password $password"

