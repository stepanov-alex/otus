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
$mysql -e "SOURCE /home/vagrant/master.sql"

echo "CREATE Repl"
$mysql -e "CHANGE MASTER TO MASTER_HOST = \"192.168.57.10\", MASTER_PORT = 3306, MASTER_USER = \"repl\", MASTER_PASSWORD = \"$password\", MASTER_AUTO_POSITION = 1"
$mysql -e "START SLAVE"
