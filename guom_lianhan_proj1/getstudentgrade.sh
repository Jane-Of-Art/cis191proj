#!/bin/bash 
echo -n "enter student pennkey:: "
read pennkey
studentline=$(grep "^$pennkey" studentlist.csv)
IFS=$'\n' read -d '' -r -a lines < studentlist.csv
IFS=',' read -d '' -r -a line1 <<< "${lines[0]}"
IFS=',' read -d '' -r -a line2 <<< "${lines[1]}"
numvars=${#line1[@]}
totalmax=0
for j in $(seq 3 $(($numvars-1)))
do
	totalmax=$(($totalmax+${line2[$j]}))
done

	IFS=$',' read -d '' -r -a vars <<< "$studentline"
	l1="${vars[0]}: "
	echo "${vars[2]} ${vars[1]} (${vars[0]})"
	totalgrade=0
	for k in $(seq 3 $(($numvars-1)))
	do
		echo "${line1[$k]}: ${vars[$k]}/${line2[$k]}" | tr "\n" " "
		echo ""
		totalgrade=$(($totalgrade+${vars[$k]}))
	done
	grade="$totalgrade/$totalmax"
	echo "Total: $grade"
