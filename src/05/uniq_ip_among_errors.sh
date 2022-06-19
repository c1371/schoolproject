#!/bin/bash

function uniq_ip_among_errors {
    local file_counter=1
    while [[ $file_counter -lt 6 ]]; do
    local file_name="Nginx_file$file_counter.log"
    echo "$file_name"
    awk '$6 ~ /[4,5]/ {print $0}' ../04/$file_name | sort -u -k1,1
    echo
    ((file_counter++))
done
}

