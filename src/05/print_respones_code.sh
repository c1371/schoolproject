#!/bin/bash

function print_respones_code {
    local file_counter=1
    while [[ $file_counter -lt 6 ]]; do
    local file_name="Nginx_file$file_counter.log"
    echo "$file_name"
    awk ' {print $0}' ../04/$file_name | sort -k6,6 -n 
    echo
    ((file_counter++))
done
}
