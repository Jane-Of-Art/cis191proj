#!/bin/bash 
# args: pennkey, assignmentname
 
echo -n "what did $1 get on $2?"
read score
IFS=$'\n' read -d '' -r -a lines < studentlist.csv
numlines=${#lines[@]}
IFS=',' read -d '' -r -a line1 <<< "${lines[0]}"
numvars=${#line1[@]}
colnum=$((1-2))
output="${lines[0]}\n${lines[1]}"
for j in $(seq 3 $(($numvars-1)))
do
	if ["$2" == "${line1[$j]}"]
	then
		colnum=$j
	fi
done
if ["$colnum" == "-1"]
then
	echo "You have entered an invalid assignment, grade will not be changed"
fi
for i in $(seq 2 $(($numlines-1)))
do
	IFS=$',' read -d '' -r -a vars <<< "${lines[$i]}"
	if ["$1" == "${vars[0]}"]
	then
		vars[$colnum]="$score"
	fi
	temp=${vars[0]}
	for k in $(seq 1 $(($numvars-1)))
	do
		temp="$temp,${vars[$k]}"
	done
	output="$output\n$temp"
done
echo "Grade has been changed for $1 on $2"
echo -e $output
