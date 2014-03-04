#!/bin/bash 

#Generate grade directory for all students

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
if [[ $colNum -eq 0 ]]; then	
	printf "Sorry, this assignment is not listed in the file.\n"		
else
	maxGrade=${line2[$(($colNum-1))]}
	dir=$(ls -l | grep $assignmentLabel | grep ^d)
	if [[ -n $dir ]]; then
		rm -r $assignmentLabel
	fi
		mkdir $assignmentLabel
	numLines=${#lines[@]}
	for i in $(seq 3 $numLines)
	do
		lastName=$(sed -n ${i}p studentlist.csv | cut -d ',' -f2)
		firstName=$(sed -n ${i}p studentlist.csv | cut -d ',' -f3)
		pennkey=$(sed -n ${i}p studentlist.csv | cut -d ',' -f1)
		grade=$(sed -n ${i}p studentlist.csv | cut -d ',' -f${colNum})
		output="${firstName} ${lastName} (${pennkey})\n"
		output2="${assignmentLabel}\nGrade: ${grade}/${maxGrade}\n"
		filename="${assignmentLabel}/${pennkey}_${assignmentLabel}_grade"
		printf "${firstName} ${lastName} (${pennkey})\n" > $filename
		printf "${assignmentLabel}\nGrade: ${grade}/${maxGrade}\n" >> $filename
	done
fi
