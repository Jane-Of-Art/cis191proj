#!/bin/bash

#sends student's grade by email

printf "Please input the student's PennKey: "
read pennkey
lineNum=$(cut -d',' -f1 studentlist.csv | grep -wn $pennkey | cut -d : -f1)
if [ -z $lineNum ]; then 
	printf "Sorry, this student is not listed in the file.\n"
else 
	printf "Please input name of assignment: "
	read assignmentLabel
	test=$(head -n 1 studentlist.csv | grep $assignmentLabel)
	if [[ -z $test ]]; then	
		printf "Sorry, this assignment is not listed in the file.\n"		
	else
		filename="${pennkey}_${assignmentLabel}_grade"
		file=$(ls -l | grep -w $filename | grep ^'-')
		dir=$(ls -l | grep $assignmentLabel | grep ^d)
		if [[ -z $file && -z $dir ]]; then
			printf "Grade file does not exist.\n"
			printf "Please run \"./generateOneGrade.sh\" or \"./generateGradeDirectory.sh\"\n." 
		else
					
		fi
	fi
fi
