#!/bin/bash

source ./check_entrances.sh
source ./loop_to_create_folders_files.sh


Check_parameters $@  

create_folders_and_files $@                                   