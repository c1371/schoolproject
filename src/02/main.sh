#!/bin/bash

source ./check_entrances.sh
source ./create_folder_and_files.sh
source ./list_with_dir.sh

start_time=`date +"%Y-%m-%d %H:%M:%S"`
start=`date +%s.%N`


script_path=$(pwd)
Check_parameters $@
create_list 
make_folders_and_files $@
rm $script_path/list_of_derictories.txt

end=`date +%s.%N`

echo "Start time: $start_time"
echo "End time: $(date +"%Y-%m-%d %H:%M:%S")"
total=$(echo "$end - $start" | bc -l )
echo "Total time: $total"
