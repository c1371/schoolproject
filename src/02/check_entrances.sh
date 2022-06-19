#!/bin/bash

Check_parameters() {

local regex_folder_name='^[a-z]*$'
local subfolder_name_parametr=$1
local length_of_subfolder_name=${#subfolder_name_parametr}
local regex_for_file_name='^[a-z]{1,7}[.][a-z]{1,3}$'
local files_name=$2
local regex_for_file_size='^[0-9]{1,2}[m][b]$'
local file_size=$3

shopt -s nocasematch


if [[  $# != 3 ]]; #total of arguments check 
then
    echo "Wrong amount of arguments"
        exit


elif [[ ! $subfolder_name_parametr =~ $regex_folder_name ]] || [[ $length_of_subfolder_name -gt 7 ]]; # subfolder name and length check | PARAMETR3
then
    echo "Wrong format: subfolder_name "
        exit

elif [[ ! $files_name =~ $regex_for_file_name ]]; #file name check format | PARAMETR5
then
    echo "Wrong format: name_of_file "
        exit
elif [[ ! $file_size =~ $regex_for_file_size ]]; #file name check format | PARAMETR5
then
    echo "Wrong format: size_of_file"
        exit
fi

}
