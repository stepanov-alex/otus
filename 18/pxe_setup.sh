#!/bin/bash
setenforce 0
dnf -y install httpd
dnf -y install tftp-server
dnf -y install dhcp-server
wget --no-check-certificate https://mirror.sale-dedic.com/centos/8-stream/isos/x86_64/CentOS-Stream-8-x86_64-latest-dvd1.iso
mount -t iso9660 CentOS-Stream-8-x86_64-latest-dvd1.iso /mnt -o loop,ro
#mount -t iso9660 /vagrant/iso/CentOS.iso /mnt -o loop,ro
mkdir /iso
cp -r /mnt/* /iso
chmod -R 755 /iso
touch /etc/httpd/conf.d/pxeboot.conf
cat > /etc/httpd/conf.d/pxeboot.conf << EOF
Alias /centos8 /iso
<Directory /iso>
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>
EOF
systemctl restart httpd && systemctl enable httpd
mkdir /var/lib/tftpboot/pxelinux.cfg
cat > /var/lib/tftpboot/pxelinux.cfg/default << EOF
default menu.c32
prompt 0
timeout 150
ONTIME local
menu title OTUS PXE Boot Menu
       label 1
       menu label  Graph install CentOS 8
       kernel /vmlinuz
       initrd /initrd.img
       append ip=enp0s3:dhcp inst.repo=http://10.0.0.20/centos8
       label 2
       menu label  Text install CentOS 8
       kernel /vmlinuz
       initrd /initrd.img
       append ip=enp0s3:dhcp inst.repo=http://10.0.0.20/centos8 text
       label 3
       menu label  rescue installed system
       kernel /vmlinuz
       initrd /initrd.img
       append ip=enp0s3:dhcp inst.repo=http://10.0.0.20/centos8 rescue
       label 4
       menu label ^ Auto-install CentOS 8
       menu default
       kernel /vmlinuz
       initrd /initrd.img
       append ip=enp0s3:dhcp inst.ks=http://10.0.0.20/centos8/ks.cfg inst.repo=http://10.0.0.20/centos8/
EOF
rpm2cpio /iso/BaseOS/Packages/syslinux-tftpboot-6.04-6.el8.noarch.rpm | cpio -dimv
cd tftpboot
cp pxelinux.0 ldlinux.c32 libmenu.c32 libutil.c32 menu.c32 vesamenu.c32 /var/lib/tftpboot/
cp /iso/images/pxeboot/{initrd.img,vmlinuz} /var/lib/tftpboot/
systemctl restart tftp.service && systemctl enable tftp.service
cat > /etc/dhcp/dhcpd.conf << EOF
option space pxelinux;
option pxelinux.magic code 208 = string;
option pxelinux.configfile code 209 = text;
option pxelinux.pathprefix code 210 = text;
option pxelinux.reboottime code 211 = unsigned integer 32;
option architecture-type code 93 = unsigned integer 16;

subnet 10.0.0.0 netmask 255.255.255.0 {
        range 10.0.0.100 10.0.0.120;

        class "pxeclients" {
          match if substring (option vendor-class-identifier, 0, 9) = "PXEClient";
          next-server 10.0.0.20;
          filename "pxelinux.0";
        }
    }
EOF
systemctl restart dhcpd && systemctl enable dhcpd
touch /iso/ks.cfg
cat > /iso/ks.cfg << EOF
#version=RHEL8
ignoredisk --only-use=sda
autopart --type=lvm
clearpart --all --initlabel --drives=sda
graphical
keyboard --vckeymap=us --xlayouts='us'
lang en_US.UTF-8
url --url=http://10.0.0.20/centos8/BaseOS/
network  --bootproto=dhcp --device=enp0s3 --ipv6=auto --activate
network  --bootproto=dhcp --device=enp0s8 --onboot=off --ipv6=auto --activate
network  --hostname=pxeclient
rootpw --iscrypted $6$WK9W2KhHH3qUSr.6$uIl62vBqQr5iMKJ2D9hwIDC1EFj6DFGNcPW5cNBpHCtxsuSb.AQse39llP0bNcw/ZaC9bHYQ.9iK0Hu8oXD8C1
firstboot --enable
skipx
services --enabled="chronyd"
timezone Europe/Moscow --isUtc
user --groups=wheel --name=vagrant --password=vagrant --gecos="otus"

%packages
@^minimal-environment
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
EOF
