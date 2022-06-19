#!/bin/bash
function del_by_log {
grep DIR ../02/log_file.txt | awk '{ print $4}' | xargs rm -rf 
}

