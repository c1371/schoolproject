#!/bin/bash

source ./function.sh

if [[ $# -gt 0 ]];then
    echo "To many arguments, try again"
    exit
fi

file_counter=1
while [[ $file_counter -lt 6 ]]; do
file_name="Nginx_file$file_counter.log"

lines_counter=$( shuf -i 100-1000 -n 1)
lines_counterG=0
        #get timestamp
        temp=$(echo "$RANDOM * $RANDOM * $RANDOM / 1000" | bc)
        now=$(date +%s)
        while [[ temp -gt $now ]]; do
        temp=$(echo "$RANDOM * $RANDOM * $RANDOM / 1000" | bc)
        done
        time_counter=1
while [[ $lines_counterG -lt $lines_counter ]];
    do
        #get ip
        ip_addr=$(generate_random_ip)
        #get timestamp
        new_temp=$((temp+$time_counter))
        Timestamp=$(date -d @$new_temp +%d/%b/%Y:%H:%M:%S)
        Timestamp_z=$(date +%z)
        #get method
        request_methods_array=("GET" "POST" "PUT" "PATCH" "DELETE") 
        request_methods=( $(shuf -e "${request_methods_array[@]}") )

        #get Response codes
        Response_codes_array=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503") #check respones_codes.txt file

        Response_codes=( $(shuf -e "${Response_codes_array[@]}") )

        #get_url
        http_referer=$(shuf url_list.txt -n 1)
        Agents_list=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
        agents_var=$( shuf -i 0-7 -n 1 )
        http_user_agent="${Agents_list[agents_var]}"

        log_format_compression="$ip_addr ["$Timestamp" "$Timestamp_z"] \"$request_methods HTTP/1.1\" $Response_codes \"$http_referer\" \"$http_user_agent (Windows NT 5.0;)\""  
        echo $log_format_compression >> Nginx_file.log
((lines_counterG++))
((time_counter++))
done
    cp Nginx_file.log "$file_name"
    >Nginx_file.log
    ((file_counter++))
done
rm Nginx_file.log