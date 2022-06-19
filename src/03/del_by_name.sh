#!/bin/bash

function del_by_name {
local date=$(date +"%d%m%y")
find / -type d > list_of_derictories.txt 2>/dev/null
grep -E "[a-z]{4,}_[0-9]{6}$" list_of_derictories.txt >> list_of_derictories2.txt
mv list_of_derictories2.txt list_of_derictories.txt

xargs -I{} rm -rf "{}" < list_of_derictories.txt
}

