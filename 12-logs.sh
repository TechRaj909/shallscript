#1/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shell-script-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d %H:%M:%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo -e "$2....$R Fail "
    exit 1
else
    echo -e "$2......$G sucess"
fi

echo "script excution started :$TIMESTAMP" &>>$LOG_FILE_NAME
}
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "this not a user"
    exit 2
fi

dnf list installed mysql &>>$LOG_FILE_NAME
 if [ $? -ne 0 ] 
 then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing"
else
  echo -e "already $Y installed mysql"&>>$LOG_FILE_NAME
fi

dnf list installed git
 if [ $? -ne 0 ]
 then
    dnf install git -y &>>$LOG_FILE_NAME
     VALIDATE $? "installing"
else
  echo -e "already $R installed git"&>>$LOG_FILE_NAME
fi


