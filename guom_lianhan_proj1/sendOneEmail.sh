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
	test=$(head -n 1 studentlist.csv | grep -w $assignmentLabel)
	if [[ -z $test ]]; then	
		printf "Sorry, this assignment is not listed in the file.\n"		
	else
		filename="${pennkey}_${assignmentLabel}_grade"
		if [[ ! -e $filename && ! -d $assignmentLabel ]]; then
			printf "Grade file does not exist.\n"
			printf "Please run \"./generateOneGrade.sh\" or \"./generateGradeDirectory.sh\"\n." 
		else
			lineNum=$(cut -d',' -f1 studentlist.csv | grep -wn $pennkey | cut -d : -f1)
			lastName=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f2)
			firstName=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f3)
			subject="${assignmentLabel} grade for ${firstName} ${lastName}" 
			if [[ -e $filename ]]; then
				mail -s "$subject" "${pennkey}@seas.upenn.edu" <  $filename
			elif [[ -d $assignmentLabel ]]; then
				if [[ ! -e "${assignmentLabel}/${filename}" ]]; then
					printf "Grade file does not exist in assignment directory.\n"
					printf "Please run \"./generateGradeDirectory.sh\" again.\n"
				else
					mail -s "$subject" "${pennkey}@seas.upenn.edu" < "${assignmentLabel}/${filename}"
				fi
			fi
		fi
	fi
fi
