#!/bin/bash

#sends all students their grade by email

printf "Please input name of assignment: "
read assignmentLabel
test=$(head -n 1 studentlist.csv | grep -w $assignmentLabel)
if [[ -z $test ]]; then	
	printf "Sorry, this assignment is not listed in the file.\n"		
else 
	if [[ ! -d $assignmentLabel ]]; then
		printf "Grade directory does not exist.\n"
		printf "Please run \"./generateGradeDirectory.sh\"\n." 
	else
		# checks if every file is in the directory
		# does not send any email if there are missing files to avoid sending duplicate emails to students
		# when script is re-run later
		check=1
		IFS=$'\n' read -d '' -r -a lines < studentlist.csv
		numlines=${#lines[@]}
		for i in $(seq 2 $(($numlines-1)))
		do
		IFS=',' read -d '' -r -a line <<< "${lines[$i]}"
		pennkey=${line[0]}
		filename="${pennkey}_${assignmentLabel}_grade"
		if [[ ! -e "${assignmentLabel}/${filename}" ]]; then
			printf "Some student grade files are missing. Please run \"./generateGradeDirectory.sh\" again.\n"
			check=0
			break
		fi
		done
		if [[ $check -eq 1 ]]; then
			for i in $(seq 2 $(($numlines-1)))
			do
			IFS=',' read -d '' -r -a line <<< "${lines[$i]}"
			pennkey=${line[0]}
			filename="${pennkey}_${assignmentLabel}_grade"
			${assignmentLabel}/${filename}
			mail -s "$subject" "${pennkey}@seas.upenn.edu" < "${assignmentLabel}/${filename}"
			done
		fi
	fi
fi
