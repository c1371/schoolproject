#!/bin/bash
#DONT TOUCH IT WORKS!

function folders_name_generator() {
local Absolute_path=$1

local folders_name=$( echo "$2" | sed -E ':a;s/((.).*)\2/\1/;ta')
local date=$(date +"%d%m%y")
local length_of_list_of_letters=${#folders_name}

if [[ $length_of_list_of_letters -lt 4 ]]; then
    counter=$length_of_list_of_letters
    while [[ counter -lt 4 ]]; do
        folders_name+="${folders_name:(-1)}"
        ((counter++))
        
    done
fi

tmp="$folders_name"

final_folder_name=("$folders_name"_"$date")

if [[ -d "$Absolute_path/$final_folder_name" ]]; then
    while [[ -d "$Absolute_path/$tmp"_"$date" ]];do
        tmp+="${folders_name:(-1)}"
    done
final_folder_name=("$tmp"_"$date")
fi
    echo "$tmp"_"$date"
}

    