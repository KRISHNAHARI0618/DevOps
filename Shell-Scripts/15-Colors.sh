#!/bin/bash

N="\e[0m"
B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
#reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37

echo -e " $N hello World"
echo -e " $B hello World"
echo -e " $R hello World"
echo -e " $G hello World"
echo -e " $Y hello World"
echo -e " $B hello World"
echo -e " $M hello World"
echo -e " $C hello World"
echo -e " $W hello World"

echo -e "$R $0 , $M $# ,$C $@,$B $1,$Y $?,$G $@"

#git add .;git commit -m "Adding New Files" ;git push origin main