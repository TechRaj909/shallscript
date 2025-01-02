#!/bin/bash

echo "hi how are you :yopur name please "
 
read uname

echo Hi user $name 

read -sp password 

echo  $password

students=(nikhil,jayanthi,raj)

echo ${students[0]}
echo ${students[2]}

echo ${students[@]}

for student in "${students[@]}";
do 
echo "studentName: $student"

done


