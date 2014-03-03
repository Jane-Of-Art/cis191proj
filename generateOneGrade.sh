#!/bin/bash 

#Generate grade file for one student 

printf "Please input the student's PennKey: "
read pennkey
lineNum=$(cut -d',' -f1 studentlist.csv | grep -wn $pennkey | cut -d : -f1)
if [ -z $lineNum ]; then 
	printf "Sorry, this student is not listed in the file.\n"
else 
	printf "Please input name of assignment: "
	read assignmentLabel
	if [ -z $(head -n 1 studentlist.csv | grep -w ${assignmentLabel}) ]; then
		printf "Sorry, this assignment is not listed in the file.\n"		
	else
		touch ${pennkey}_${assignmentlabel}_grade
		lastName=$(sed ${lineNum}p | cut -d ',' -f2)
		firstName=$(sed ${lineNum}p | cut -d ',' -f3)
		grade=$(sed ${lineNum}p | cut -d ',' -f3)
		printf $lastName $firstName $grade
	fi
fi
