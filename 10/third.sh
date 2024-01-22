#!/bin/bash

setenforce 0

sed -i '/HTTPD/a\EnvironmentFile=\/etc\/sysconfig\/httpd-\%i' /usr/lib/systemd/system/httpd@.service

echo 'OPTIONS=-f conf/first.conf' > /etc/sysconfig/httpd-first
echo 'OPTIONS=-f conf/second.conf' > /etc/sysconfig/httpd-second

cp -v /etc/httpd/conf/httpd.conf /etc/httpd/conf/first.conf
cp -v /etc/httpd/conf/httpd.conf /etc/httpd/conf/second.conf

sed -i -e '/^#/d;/.*#/d;/^$/d;s/80/8080/; /8080/i\PidFile \/var\/run\/httpd-first.pid' /etc/httpd/conf/first.conf
sed -i -e '/^#/d;/.*#/d;/^$/d;s/80/8081/; /8081/i\PidFile \/var\/run\/httpd-second.pid' /etc/httpd/conf/second.conf

systemctl daemon-reload
systemctl start httpd@first
systemctl start httpd@second