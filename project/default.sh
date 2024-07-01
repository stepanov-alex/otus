#!/bin/bash

sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

dnf install -y vim telnet glibc-langpack-ru git

localectl set-locale LANG=ru_RU.UTF-8
timedatectl set-timezone Europe/Moscow

cp /vagrant/.vimrc ~
cp /vagrant/.vimrc /home/vagrant/
