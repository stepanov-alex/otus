#!/bin/bash

dnf install -y vim telnet glibc-langpack-ru git
localectl set-locale LANG=ru_RU.UTF-8
timedatectl set-timezone Europe/Moscow

cp /vagrant/.vimrc ~
cp /vagrant/.vimrc /home/vagrant/
