#!/bin/bash 
# args: n/a
IFS=$'\n' read -d '' -r -a lines < studentlist.csv
numlines=${#lines[@]}
IFS=',' read -d '' -r -a line1 <<< "${lines[0]}"
IFS=',' read -d '' -r -a line2 <<< "${lines[1]}"
numvars=${#line1[@]}
totalmax=0
for j in $(seq 3 $(($numvars-1)))
do
	totalmax=$(($totalmax+${line2[$j]}))
done
for i in $(seq 2 $(($numlines-1)))
do
	IFS=$',' read -d '' -r -a vars <<< "${lines[$i]}"
	l1="${vars[0]}: "
	echo -n $l1
	totalgrade=0
	for k in $(seq 3 $(($numvars-1)))
	do
		totalgrade=$(($totalgrade+${vars[$k]}))
	done
	grade="$totalgrade/$totalmax"
	echo $grade
done
