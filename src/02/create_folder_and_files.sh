#!/bin/bash
source ./folders_name_generator.sh
source ./file_name_generator.sh

function make_folders_and_files {

number_of_folders=`shuf -i 0-100 -n 1`
counter=0
script_path=$(pwd)


while [[ counter -lt $number_of_folders ]]; do
size=$(df --output=avail -k / | tail -n 1)
    if [[ $size -lt 1148576 ]]; then 
        echo "ERROR.NOTENOUGHSPACE."
        echo "ERROR.NOTENOUGHSPACE.   [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")]" >> log_file.txt 
            exit    
    fi
random_path=`shuf -n 1 $script_path/list_of_derictories.txt`


folder_name=$(folders_name_generator $random_path $1)

cd $random_path 2>/dev/null  #check if u get into dirrectorie
        while [[ $? -ne 0 ]]; do
            random_path=`shuf -n 1 $script_path/list_of_derictories.txt`
            cd $random_path 2>/dev/null
        done

mkdir "$random_path/$folder_name" 2>/dev/null
    while [[ $? -ne 0 ]]; do
            random_path=`shuf -n 1 $script_path/list_of_derictories.txt`
            cd $random_path 2>/dev/null
            mkdir "$random_path/$folder_name" 2>/dev/null
        done
file_counter=0
    echo "CREATED:DIR  [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")]   $random_path/$folder_name"  >> $script_path/log_file.txt 
    cd "$random_path/$folder_name"
    number_of_files_to_create=`shuf -i 1-12 -n 1`
        while [[ $file_counter -lt $number_of_files_to_create ]]; do 
        size=$(df --output=avail -k / | tail -n 1)
            if [[ $size -lt 1148576 ]]; then 
                echo "not enough space"
                echo "ERROR.NOTENOUGHSPACE.   [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")]" >> log_file.txt 
                    exit    
            fi
        file_name=$(file_name_generator $@)
        $(fallocate -l $3 $random_path/$folder_name/$file_name) #create file
        ((file_counter++))
        echo "CREATED:FILE [$(date +"%d-%m-%Y") $(date +"%H:%M:%S")]   $random_path/$folder_name/$file_name $3"  >> $script_path/log_file.txt 
        done
    ((counter++))
    cd .. 
done
}