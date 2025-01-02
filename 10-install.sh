#1/bin/bash

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo "$2....Fail"
    exit 1
else
    echo "$2......sucess"
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
  echo "already installed mysql"
fi

dnf list installed git
 if [ $? -ne 0]
 then
    dnf install git -y
     VALIDATE $? "installing"
else
  echo "already installed git"
fi


