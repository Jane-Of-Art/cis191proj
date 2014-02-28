#!/bin/sh 
# args: pennkey

cat studentlist.csv | grep -w $1 | 
echo -n "are you sure you want to delete user $1? (Y/n) "
read bo
echo $bo
if [ x"$bo" = x"Y" ]; then 
  echo "you said yes, user $1 will now be deleted."
  #code to delete line here
elif [ x"$bo" = x"n" ]; then
  echo "you said no, script will now terminate."
else
  echo "Invalid input, script will now terminate."
fi
