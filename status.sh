#!/bin/bash

wall -n "               Status

Sudo            = sudo -l
log             = cat /var/log/sudo/sudo.log

AppArmor        = sudo aa-status | head -n 1

SSH             = sudo systemctl status ssh

UFW             = sudo ufw status

lighttpd        = sudo systemctl status lighttpd

MariaDB         = sudo systemctl status mariadb
                = mysql -u root -p
                        show databases;
                        exit

Fail2ban        = sudo systemctl status fail2ban
                = sudo fail2ban-client status
                = sudo fail2ban-client status sshd
                = sudo tail -f /var/log/fail2ban.log
"
