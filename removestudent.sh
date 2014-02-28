#!/bin/sh 
# args: pennkey
echo "are you sure you want to delete user $1? (Y/n)"
read bo
echo $bo
if [ "$bo" = "Y" ] then 
	echo "you said yes, user $1 will now be deleted."
elif [ "$bool" = "n" ] then
	echo "you said no, script will now terminate."
else
	echo "Invalid input, script will now terminate."
fi
