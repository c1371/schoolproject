#!/bin/bash



function print_ip {
    local file_counter=1
    while [[ $file_counter -lt 6 ]]; do
    local file_name="Nginx_file$file_counter.log"
    echo "$file_name"
    awk ' {print $1}' ../04/$file_name | uniq
    echo
    ((file_counter++))
done
}