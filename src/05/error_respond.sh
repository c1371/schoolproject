#!/bin/bash

function error_respond {
    local file_counter=1
    while [[ $file_counter -lt 6 ]]; do
    local file_name="Nginx_file$file_counter.log"
    echo "$file_name"
    awk '$6 ~ /[4,5]/ {print $0}' ../04/$file_name
    echo
    ((file_counter++))
done
}