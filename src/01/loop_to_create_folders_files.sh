#!/bin/bash
source ./folders_name_generator.sh
source ./file_name_generator.sh

source ./check_entrances.sh

Check_parameters $@  

script_path=$(pwd)
function create_folders_and_files {

Absolute_path=$1

number_folders_to_create=$2
number_of_files_to_create=$4
counter=0
cd "$Absolute_path"
size=$(df --output=avail -k / | tail -n 1)
while [[ $counter -lt $number_folders_to_create ]]; do
    
    if [[ $size -lt 1048576 ]]; then 
        echo "ERROR. NOT ENOUGH SPACE."
        echo "ERROR. NOT ENOUGH SPACE. [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")]" >> log_file.txt 
            exit    
    fi
    folder_name=$(folders_name_generator $@)
    mkdir $folder_name #create a folder
    file_counter=0
    echo "CREATED:DIR  [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $Absolute_path$folder_name"  >> $script_path/log_file.txt 
    cd "$Absolute_path/$folder_name"
        while [[ $file_counter -lt $number_of_files_to_create ]];do 
            if [[ $size -lt 1048576 ]]; then 
                echo "not enough space"
                echo "ERROR. NOT ENOUGH SPACE. [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")]" >> log_file.txt 
                    exit    
            fi
            file_name=$(file_name_generator $@)
            ((file_counter++))
            $(fallocate -l $6 $Absolute_path/$folder_name/$file_name) #create file
            echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")] $Absolute_path$folder_name/$file_name $6"  >> $script_path/log_file.txt 
        done
    ((counter++))
    cd .. 
done
}
