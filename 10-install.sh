#1/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "this not a user"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "mysql install not hapeen"
    exit 2
else
    echo "mysql install sucess"
fi
dnf install git -y

if [ $? -ne 0 ]
then 
    echo "git instll not hapeen"
    exit 2
else
    echo "git install sucess"
fi


