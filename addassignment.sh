#!/bin/sh 
# args: assignment name
 
echo -n "what is the max score for $1?"
read max
sed -n "1 s/$/, $1/" studentlist.csv
sed -n "2 s/$/, $max/" studentlist.csv
lines = $(wc -l studentlist.csv)
echo $lines
for i in $(seq 3 $lines)
do
	tempkey= "next student" #get pennkey first word of line $i NEED TO WRITE
	echo -n "What is the score for $tempkey?"
	read score
	sed -n "$i s/$/, $score/" studentlist.csv
done
