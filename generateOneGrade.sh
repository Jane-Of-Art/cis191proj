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
	
	IFS=$'\n' read -d '' -r -a lines < studentlist.csv
	IFS=',' read -d '' -r -a line1 <<< "${lines[0]}"
	IFS=',' read -d '' -r -a line2 <<< "${lines[1]}"
	numvars=${#line1[@]}
	colNum=0
	for i in $(seq 3 $(($numvars-1)))
	do
		test=$(echo ${line1[$i]} | grep -w $assignmentLabel) 
		if [[ $test = $assignmentLabel ]]; then
			colNum=$(($i+1))	
		fi
	done
	# if [ -z "$(head -n 1 studentlist.csv | grep -w ${assignmentLabel})" ]; then
	if [[ $colNum -eq 0 ]]; then	
		printf "Sorry, this assignment is not listed in the file.\n"		
	else
		touch ${pennkey}_${assignmentlabel}_grade
		lastName=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f2)
		firstName=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f3)
		grade=$(sed -n ${lineNum}p studentlist.csv | cut -d ',' -f${colNum})
		maxGrade=${line2[$(($colNum-1))]}
		output="${firstName} ${lastName} (${pennkey})\n"
		output2="${assignmentLabel}\nGrade: ${grade}/${maxGrade}\n"
		printf "${firstName} ${lastName} (${pennkey})\n"
		printf "${assignmentLabel}\nGrade: ${grade}/${maxGrade}\n"
	fi
fi
