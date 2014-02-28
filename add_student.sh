#!/bin/bash

echo "$1, $2, $3" >> studentlist.csv

head -n 1 studentlist.csv | fgrep -o , | wc -l

 

