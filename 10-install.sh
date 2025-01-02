#1/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
echo "this not a user"
fi