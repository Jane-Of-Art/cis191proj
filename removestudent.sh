#!/bin/sh 
# args: pennkey

lineNum=$(cut -d',' -f1 studentlist.csv | grep -wn $1 | cut -d : -f1)
# $(cut -d',' -f1 studentlist.csv | grep -cw $1) -lt 1 
if [ -z $lineNum ]; then 
	echo  "sorry, student is not listed in the file."
else	
	printf "are you sure you want to delete student $1? (Y/n) "
	read bo
	if [ x"$bo" = x"Y" ]; then 
		echo "you said yes, student $1 will now be deleted."
		# delete line here
		sed ${lineNum}d studentlist.csv > tmp.csv 
		cat < tmp.csv > studentlist.csv
		rm tmp.csv
	elif [ x"$bo" = x"n" ]; then
		echo "you said no, script will now terminate."
	else
		echo "Invalid input, script will now terminate."
	fi
fi
