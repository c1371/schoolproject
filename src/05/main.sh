#!/bin/bash
source ./error_respond.sh
source ./print_ip.sh
source ./print_respones_code.sh
source ./uniq_ip_among_errors.sh

if [[ $# -gt 1 ]];then
    echo "To many arguments, try again"
    exit
    fi

case $1 in
    1)
    print_respones_code ;;
    2)
    print_ip ;;
    3)
    error_respond ;;
    4)
    uniq_ip_among_errors;;
    *)
     echo "Wrong input"
        exit
esac

