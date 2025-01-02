#1/bin/bash
R ="\e[31m"
G ="\e[32m"
Y ="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo -e "$2....$R Fail "
    exit 1
else
    echo -e "$2......$G sucess"
fi

}
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "this not a user"
    exit 2
fi

dnf list installed mysql
 if [ $? -ne 0]
 then
    dnf install mysql -y
    VALIDATE $? "installing"
else
  echo -e "already $G installed mysql"
fi

dnf list installed git
 if [ $? -ne 0]
 then
    dnf install git -y
     VALIDATE $? "installing"
else
  echo -e "already $Y installed git"
fi


