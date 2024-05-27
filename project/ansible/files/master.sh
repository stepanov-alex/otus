#!/bin/bash

password='Otus2024!'
temp_pass=$(cat /var/log/mysqld.log | grep 'root@localhost' | awk '{print $11}')
echo $temp_pass

touch ~/.my.cnf
cat <<EOF >~/.my.cnf
[client]
user=root
password="$temp_pass"
EOF

mysql="mysql -uroot --connect-expired-password"
echo "Change Password"
$mysql -e "ALTER USER USER() IDENTIFIED BY \"$password\""

rm -f ~/.my.cnf

cat <<EOF >~/.my.cnf
[client]
user=root
password="$password"
EOF

echo "CREATE DATABASE"
$mysql -e "CREATE DATABASE wordpressdb"
$mysql -D wordpressdb </home/vagrant/wordpress_dump.sql

#echo "CREATE wordpressuser"
#$mysql -e "CREATE USER 'wordpressuser'@'%' IDENTIFIED BY "superpassword"
#$mysql -e "GRANT REPLICATION SLAVE ON wordpressdb.* TO 'wordpressuser'@'%' IDENTIFIED BY "superpassword"
