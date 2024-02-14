#!/bin/bash
if [ $(date +%a) = "Sat" ] || [ $(date +%a) = "Sun" ]; then
 if getent group admins | grep -qw "$PAM_USER"; then
	echo "$PAM_USER" user accept
        exit 0
      else
	echo "$PAM_USER" user deny
        exit 1
    fi
 else
   exit 0
fi
