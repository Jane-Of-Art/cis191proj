#!/bin/sh 
# args: pennkey

if [ $(cut -d',' -f1 studentlist.csv | grep -cw $1) -lt 1 ]; then 
	echo  "sorry, student is not listed in the file."
else	
	echo -n "are you sure you want to delete student $1? (Y/n) "
	read bo
	if [ x"$bo" = x"Y" ]; then 
		echo "you said yes, student $1 will now be deleted."
		#code to delete line here
		lineNum=$(sed -n ${1}/= studentlist.csv)
		sed ${lineNum}d studentlist.csv		
	elif [ x"$bo" = x"n" ]; then
		echo "you said no, script will now terminate."
	else
		echo "Invalid input, script will now terminate."
	fi
fi
