#/bin/bash
echo 'Create part /dev/sdb1'
parted -s /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary xfs 0% 100%
mkfs.xfs /dev/sdb1

echo 'Create directory /var/backup'
mkdir /var/backup

echo 'Mounting /var/backup'
mount -t xfs /dev/sdb1 /var/backup
chown borg:borg /var/backup
echo '/dev/sdb1 /var/backup xfs defaults 0 0' >> /etc/fstab

