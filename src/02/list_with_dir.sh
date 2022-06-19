#!/bin/bash

function create_list {
find / -type d >>list_of_derictories.txt 2>/dev/null
grep -v '[a-z]*[[:space:]][a-z]*\|bin\|tmp\|proc\|snap\|\.[a-z]*' list_of_derictories.txt > list_of_derictories2.txt
mv list_of_derictories2.txt list_of_derictories.txt
}

