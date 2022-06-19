#!/bin/bash

source ./del_by_log.sh
source ./del_by_name.sh
source ./del_by_time.sh

if [[ $# -gt 1 ]];then
    echo "To many arguments, try again"
    exit
fi

case $1 in
    1)
    del_by_log ;;

    2)
    delete_by_time ;;

    3)
    del_by_name ;;
    *)
     echo "Wrong input"
        exit
esac
