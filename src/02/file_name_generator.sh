#!/bin/bash

function file_name_generator {

pattern_var=$( echo "$2" | sed -E ':a;s/((.).*)\2/\1/;ta')
IFS='.'                                                                                     #delimetr

read -ra array_with_name_and_extension <<< "$pattern_var"                                   #first element of this array is the name of the file and second is extension
IFS=''                                                                                      #set dellimetr back to nothing otherwise we can add "." beetween file name and extension
length_of_file_name=${#array_with_name_and_extension[0]}

file_name=${array_with_name_and_extension[0]}

if [[ $length_of_file_name -lt 4 ]]; then                                                   #check if length of file name is less then 4, otherwise add letter till it gets 4
    counter=$length_of_file_name
    while [[ $counter -lt 4 ]]; do
        file_name+="${array_with_name_and_extension[0]:(-1)}"
        ((counter++))
    done
fi
local tmp=$file_name
file_name+=".${array_with_name_and_extension[1]}"

local path=$(pwd)
if [[ -f "$path/$file_name" ]]; then
    while [[ -f "$path/$tmp"."${array_with_name_and_extension[1]}" ]];do
        tmp+="${array_with_name_and_extension[0]:(-1)}"
    done
final_file_name=("$tmp"."${array_with_name_and_extension[1]}")
fi
    echo "$tmp"."${array_with_name_and_extension[1]}"
}