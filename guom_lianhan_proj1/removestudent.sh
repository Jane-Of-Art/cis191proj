#!/bin/bash 

printf "Please input student's PennKey: "
read pennKey

lineNum=$(cut -d',' -f1 studentlist.csv | grep -wn $pennKey | cut -d : -f1)
if [ -z $lineNum ]; then 
	echo  "sorry, student is not listed in the file."
else	
	printf "are you sure you want to delete student $pennKey? (Y/n) "
	read bo
	if [ x"$bo" = x"Y" ]; then 
		echo "you said yes, student $pennKey will now be deleted."
		# deletes line 
		sed ${lineNum}d studentlist.csv > tmp.csv 
		cat < tmp.csv > studentlist.csv
		rm tmp.csv
	elif [ x"$bo" = x"n" ]; then
		echo "you said no, script will now terminate."
	else
		echo "Invalid input, script will now terminate."
	fi
fi
