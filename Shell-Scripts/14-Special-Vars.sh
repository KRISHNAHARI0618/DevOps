#!/bin/bash

var1=$1
var2=$2
N="\e[0m"
B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"

echo -e  " $G Var1 = ${var1} $N"
echo -e  "$R var2 = ${var2} $N"

echo -e  " $C No of Arguments = $# $N "
echo -e  "$M All Arguments = $@ $N"
echo -e  "Script Name is = $0"
ScriptName=$0
Date=$(date +%F)
LogFile=/tmp/$ScriptName-$Date.log

echo -e  "My Script Name is = ${LogFile}"
echo -e  "Date is = ${Date}"
echo -e  "Script Name = ${ScriptName}"

validation() {
    if [ $1 -ne 0 ]
    then
        echo -e  "$2 is Failure"
    else
        echo -e  "$2 is Success"
    fi
}

sudo yum install mysql -y &>> $LogFile

validation $? "mysql"

sudo yum install git -y &>> $LogFile

validation $? "git" 

sudo yum install nginx -y &>> $LogFile

validation $? "nginx" 

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo &>> $LogFile

validation $? "jenkins Repo Adding"

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>> $LogFile

validation $? "Importing the key"

sudo yum upgrade -y &>> $LogFile

validation $? "Upgrading is "

# Add required dependencies for the jenkins package
sudo yum install fontconfig java-17-openjdk -y &>> $LogFile

validation $? "Java Installation"

sudo yum install jenkins -y &>> $LogFile

validation $? "jenkins"

sudo systemctl daemon-reload &>> $LogFile

validation $? "Daemon-reload "

