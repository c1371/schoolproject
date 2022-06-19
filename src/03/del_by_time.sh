#!/bin/bash

#Main idea of this function it's to compare how many minutes ago was specified time
#Then with find function find derictories which were created and then delete them

function delete_by_time {
read -p $'Please enter date in format: 1970-05-22 \n' user_data

regex_data='^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
regex_time='^([01]?[0-9]|2[0-3]):[0-5][0-9]$'

if [[ ! $user_data =~ $regex_data ]] || ! (date -d "$user_data") &>/dev/null
        then echo "Wrong data. Try Again"
      exit
fi

date_now=$(date --date "$(date +"%Y-%m-%d %H:%M:%S")" +%s)
user_date_sec=$(date --date "$(date +"$user_data")" +%s)
res=$((date_now - user_date_sec))

if [[ res -lt 0 ]]; then
    echo "We can't travel in future bruh :) "
    exit
fi

read -p $'Please enter start time up to the minute in 24 Hour format: 16:15 \n' user_start_time

if [[ ! $user_start_time =~ $regex_time ]]
      then echo "Wrong time format or same time. Try Again"
      exit
fi

user_date_and_Stime_sec=$(date --date "$(date +"$user_data $user_start_time")" +%s)
res2=$((date_now - user_date_and_Stime_sec))
if [[ res2 -lt 0 ]]; then
    echo "We can't travel in future bruh :) "
    exit
fi

read -p $'Please enter end time up to the minute in 24 Hour format: 16:20 \n' user_end_time
user_date_and_Etime_sec=$(date --date "$(date +"$user_data $user_end_time")" +%s)

if [[ ! $user_end_time =~ $regex_time ]] || [[ "$user_end_time" == "$user_start_time" ]]
      then echo "Wrong time format same time. Try Again"
      exit
fi

start_time=$(( (date_now - user_date_and_Stime_sec)/60 ))
end_time=$(( (date_now - user_date_and_Etime_sec)/60 ))

#find dir which is older then $end_time and younger then $start_time
find / -type d -mmin "+$end_time" -mmin "-$start_time" >log_file.txt 2>/dev/null

grep '[a-z]*[_][0-9]\{6\}$' log_file.txt > log_file2.txt
mv log_file2.txt log_file.txt
xargs -I{} rm -rf "{}" < log_file.txt
rm log_file.txt
}