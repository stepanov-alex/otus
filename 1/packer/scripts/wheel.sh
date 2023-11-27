#!/bin/bash -eu

date > /etc/box_build_time


echo "==> Giving ${SSH_USER} sudo powers" 
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant 
chmod 440 /etc/sudoers.d/vagrant
