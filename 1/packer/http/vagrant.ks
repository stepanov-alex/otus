eula --agreed

lang en_US.UTF-8
keyboard us
timezone UTC+3

network --bootproto=dhcp --device=link --activate
network --hostname=otus-1

rootpw vagrant
authconfig --enableshadow --passalgo=sha512
user --groups=wheel --name=vagrant --password=vagrant --gecos="vagrant"

selinux --enforcing
firewall --disabled

firstboot --disable

%packages 
@^minimal-environment
@standard
chrony
sudo
%end

text

url --url="http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/"


bootloader --location=mbr --append="ipv6.disable=1 crashkernel=auto"

skipx
logging --level=info
zerombr
clearpart --all --initlabel

autopart --type=lvm

reboot
