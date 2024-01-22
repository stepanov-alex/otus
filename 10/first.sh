#!/bin/bash

touch /etc/sysconfig/watchlog
touch /opt/watchlog.sh
touch /etc/systemd/system/watchlog.service
touch /etc/systemd/system/watchlog.timer
touch /var/log/watchlog.log

for i in {1..10}
do
	echo "ALERT" >> /var/log/watchlog.log
done

cat > /etc/sysconfig/watchlog << END
WORD="ALERT"
LOG=/var/log/watchlog.log
END

cat > /opt/watchlog.sh << END
#!/bin/bash

WORD=\$1
LOG=\$2
DATE=\`date\`

if grep \$WORD \$LOG &> /dev/null
then
logger "\$DATE: I found word, Master!"
else
exit 0
fi
END
sed -i '/^$/d' /opt/watchlog.sh
chmod +x /opt/watchlog.sh

cat > /etc/systemd/system/watchlog.service << END
[Unit]
Description=My watchlog service

[Service]
Type=oneshot
EnvironmentFile=/etc/sysconfig/watchlog
ExecStart=/opt/watchlog.sh \$WORD \$LOG
END

cat > /etc/systemd/system/watchlog.timer << END
[Unit]
Description=Run watchlog script every 30 second

[Timer]
# Run every 30 second
OnUnitActiveSec=30
Unit=watchlog.service

[Install]
WantedBy=multi-user.target
END


systemctl daemon-reload
systemctl start watchlog.timer
systemctl start watchlog.service
