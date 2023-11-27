#!/bin/bash

sudo yum install -y elfutils-libelf-devel gcc kernel-devel make perl-interpreter libXt libXmu

KERN_DIR=/usr/src/kernels/`uname -r`
export KERN_DIR
export MAKE='/usr/bin/gmake -i'

# Mount the disk image
cd /tmp
mkdir /tmp/isomount
mount /dev/sr1 /tmp/isomount

# Install the drivers
/tmp/isomount/VBoxLinuxAdditions.run --nox11

# Cleanup
umount isomount
