#!/bin/bash

nginx_access="/var/log/nginx/access.log"
nginx_error="/var/log/nginx/error.log"

if [ -f last_run.log ]; then
    last_run=$(cat last_run.log)
else
    last_run=$(date "+%Y-%m-%d %H:%M:%S")
fi


LOCKFILE=/tmp/my_script.lock
if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
    echo "Script is already running."
    exit 1
fi
echo $$ > ${LOCKFILE}


awk -v last_run="$last_run" '$4>last_run {print $1}' $nginx_access | sort | uniq -c | sort -rn > ip_requests.tmp
echo "List of IP addresses (with the largest number of requests):"
cat ip_requests.tmp


awk -v last_run="$last_run" '$4>last_run {print $7}' $nginx_access | sort | uniq -c | sort -rn > url_requests.tmp
echo "List of requested URLs (with the largest number of requests):"
cat url_requests.tmp


awk -v last_run="$last_run" '$4>last_run {print $3 " " $9}' $nginx_error | sort | uniq > errors.tmp
echo "Web server/application errors:"
cat errors.tmp


awk -v last_run="$last_run" '$4>last_run {print $9}' $nginx_access | sort | uniq -c | sort -n > http_codes.tmp
echo "List of all HTTP response codes:"
cat http_codes.tmp


date "+%Y-%m-%d %H:%M:%S" > last_run.log


rm ip_requests.tmp url_requests.tmp errors.tmp http_codes.tmp


rm -f ${LOCKFILE}

