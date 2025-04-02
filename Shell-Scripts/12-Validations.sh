#!/bin/bash

#Validations are there for the scripts

# $? == 0 --> Success
# $? == 1 --> Failure

validation(){
    if [ $1 -eq 0 ]
    then
        echo "$2 is Success"
    else
        echo "$2 is Failure"
    fi
}


sudo yum update -y 

validation $? "Update" 

sudo yum install -y mariadb-server

validation $? "Mariadb-server" 

sudo systemctl enable mariadb

validation $? "enables maria db " 

sudo systemctl start mariadb

validation $? "started mariadb" 

sudo mysql_secure_installation

validation $? "Secure Installation" 

