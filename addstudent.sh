#!/bin/sh 
# args: pennkey, lastname, firstname. Assignments default to 0
numcommas=$(head -n 1 studentlist.csv | fgrep -o , | wc -l)
printf "$1, $2, $3" >> studentlist.csv
for i in $(seq 3 $numcommas)
do
	printf ", 0" >> studentlist.csv
done
echo "" >> studentlist.csv
