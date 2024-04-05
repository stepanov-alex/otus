#!/bin/bash

echo -e "PID\tSTAT\tTIME\tCOMMAND"

pid_list=$(ls -l /proc | grep '^d' | awk '{print $9}' | grep -E '^[0-9]+$')

for pid in $pid_list
do
if [ -d "/proc/$pid" ]
then
	state=$(cat /proc/$pid/status | grep State | awk '{print $2}')
	time=$(cat /proc/$pid/stat | awk '{print $14}')
	command=$(cat /proc/$pid/cmdline | tr '\0' ' ')
	if [ -z "$command" ]
	then
	command=$(cat /proc/$pid/stat | awk '{print $2}')
	fi

	echo -e "$pid\t$state\t$time\t$command"
fi
done

exit 0
