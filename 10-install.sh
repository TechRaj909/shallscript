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
    echo "instll not hapeen"
else
    echo "install sucess"
exit 2

