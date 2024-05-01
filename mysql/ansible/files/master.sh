#!/bin/bash

password='!Otus2024'
temp_pass=`cat /var/log/mysqld.log | grep 'root@localhost' | awk '{print $11}'`
echo $temp_pass

touch ~/.my.cnf
cat << EOF > ~/.my.cnf
[client]
user=root
password="$temp_pass"
EOF

mysql="mysql -uroot --connect-expired-password"
echo "Change Password"
$mysql -e "ALTER USER USER() IDENTIFIED BY \"$password\""

rm -f  ~/.my.cnf

cat << EOF > ~/.my.cnf
[client]
user=root
password="$password"
EOF

echo "CREATE DATABASE"
$mysql -e "CREATE DATABASE bet"
$mysql -D bet < /home/vagrant/bet.dmp

echo "CREATE ReplUser"
$mysql -e "CREATE USER 'repl'@'%' IDENTIFIED BY \"$password\""
$mysql -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%' IDENTIFIED BY \"$password\""

echo 'DUMP DATABASES'
mysqldump --all-databases --events --triggers --routines --master-data --ignore-table=bet.events_on_demand --ignore-table=bet.v_same_event> /home/vagrant/master.sql

