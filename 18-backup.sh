#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#SOURCE_DIR="/home/ec2-user/app-logs"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=$(3:-14) # if user did't provided anything 14 days by defult it will take 

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

USAGE(){
    echo -e "$R USESSGE: $N 18.backup.sh <source Dir> <distnation Dir> reqiuied"
}

    if($# -lt 2)
then
 USAGE 
fi

mkdir -p /home/ec2-user/shellscript-logs/

if [ ! -d "$SOURCE_DIR" ]
then
    echo -e "$SOURCE_DIR Does not exist Please check"
    exit 1
fi

if [ ! -d "$DEST_DIR" ]
then
    echo -e "$DEST_DIR Does not exist Please check"
    exit 1
fi





