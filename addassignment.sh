#!/bin/bash 
 
echo -n "enter assignment to add: "
read assign
echo -n "what is the max score for $assign? "
read max
IFS=$'\n' read -d '' -r -a lines < studentlist.csv
numlines=${#lines[@]}
lines[0]="${lines[0]},$assign"
lines[1]="${lines[1]},$max"
output="${lines[0]}\n${lines[1]}"
for i in $(seq 2 $(($numlines-1)))
do
	IFS=$',' read -d '' -r -a vars <<< "${lines[$i]}"
	echo -n "what is the score for ${vars[0]}? "
	read score
	lines[$i]="${lines[$i]},$score"
	output="$output\n${lines[$i]}"
done
echo "you are done with adding grades for $assign!"
echo -e $output > studentlist.csv
