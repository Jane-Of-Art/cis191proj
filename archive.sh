#!/bin/sh 
echo -n "enter semester name (fall/spring/summer): "
read sem
echo -n "enter year (YYYY): "
read year
filename="$year_$sem_backup.tar.gz"
tar czvf $filename studentlist.csv
