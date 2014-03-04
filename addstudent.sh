#!/bin/bash 
# Adds one student to studentlist.csv. Assignments default to 0
printf "Please input PennKey: "
read pennkey
lineNum=$(cut -d',' -f1 studentlist.csv | grep -w $pennkey | cut -d , -f1)
if [[ $pennkey = $lineNum ]]; then 
	printf "Sorry, this student is already listed in the file.\n"
else 
	printf "Please input student's first name: "
	read first
	printf "Please input student's last name: "
	read last
	numcommas=$(head -n 1 studentlist.csv | fgrep -o , | wc -l)
	printf "$pennkey, $last, $first" >> studentlist.csv
	for i in $(seq 3 $numcommas)
	do
		printf ", 0" >> studentlist.csv
	done
	echo "" >> studentlist.csv
fi
