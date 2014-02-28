#!/bin/sh 
# args: pennkey

echo "who do you want me to remove? Pls insert Pennkey."

cat studentlist.csv 

echo "are you sure you want to delete user $1? (Y/n)"
read bool
if (bool=="Y"); then 
	echo "you said yes, user $1 will now be deleted."
elif(bool=="n"); then
	echo "you said no, script will now terminate."
else
	echo "Invalid input, script will now terminate."
fi
