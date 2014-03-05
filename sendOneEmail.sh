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
		file=$(ls -l | grep -w $filename | grep ^'-')
		dir=$(ls -l | grep $assignmentLabel | grep ^d)
		if [[ -z $file && -z $dir ]]; then
			printf "Grade file does not exist.\n"
			printf "Please run \"./generateOneGrade.sh\" or \"./generateGradeDirectory.sh\"\n." 
		elif [[ -n $file ]]; then
			lineNum=$(cut -d',' -f1 studentlist.csv | grep -wn $pennkey | cut -d : -f1)
			lastName=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f2)
			firstName=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f3)
			subject="${assignmentLabel} grade for ${firstName} ${lastName}" 
			dos2unix $filename
			contents="$(cat $filename) ^D"
			# mail -s $($subject) "$(${pennkey}@seas.upenn.edu)" <<<  $($contents)
			mail -s $($subject) "$(${pennkey}@seas.upenn.edu)" <  $filename
			# echo $contents | sed s/' '/'\ '/g | mail -s $($subject) "$(${pennkey}@seas.upenn.edu)" 
			mail -s "testfromscript" loh.lianhan@gmail.com < tux_exam1_grade
			mail -s "testfromscript" lianhan@seas.upenn.edu < tux_exam1_grade
			echo reached
		fi
	fi
fi
