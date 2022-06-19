#!/bin/bash

Check_parameters() {

local Absolute_path=$1
local regex_for_2_and_4_parametr='^[0-9]*$'
local number_of_subfolders=$2
local regex_folder_name='^[a-z]*$'
local subfolder_name_parametr=$3
local length_of_subfolder_name=${#subfolder_name_parametr}
local number_of_files=$4
local regex_for_file_name='^[a-z]{1,7}[.][a-z]{1,3}$'
local files_name=$5
local regex_for_file_size='^[0-9]{1,2}[k][b]$'
local file_size=$6

shopt -s nocasematch


if [[  $# != 6 ]]; #total of arguments check 
then
    echo "Wrong amount of arguments"
        exit

elif [[ ! -d $Absolute_path ]]; # Absolute path check | PARAMETR1
then 
    echo "No such directory"
        exit

elif [[ ! $number_of_subfolders =~ $regex_for_2_and_4_parametr ]]; #number of subfolders check | PARAMETR2
then
    echo "Wrong format: number_of_subfolders "; 
        exit 

elif [[ ! $subfolder_name_parametr =~ $regex_folder_name ]] || [[ $length_of_subfolder_name -gt 7 ]]; # subfolder name and length check | PARAMETR3
then
    echo "Wrong format: subfolder_name "
        exit

elif [[ ! $number_of_files =~ $regex_for_2_and_4_parametr ]]; #number of files check | PARAMETR4
then
    echo "Wrong format: number_of_files "; 
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

