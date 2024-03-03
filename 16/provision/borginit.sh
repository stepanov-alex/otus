#!/bin/bash -eu

export BORG_PASSPHRASE="123"

ssh-keyscan -H 192.168.11.160 >> /root/.ssh/known_hosts

borg init --encryption=repokey borg@192.168.11.160:/var/backup

