#!/bin/bash
wall -n "               Eval

Connect user (not root): su student

Status check for ufw: sudo ufw status
                 ssh: sudo systemctl status ssh

Check os: hostnamectl

check sudo: sudo --version

Add student to sudo: sudo gpasswd -a student sudo

Sudo:  sudo -l or sudo -ll
(list user's sudo privileges)

Sudo implementation of the rules: sudo visudo

Sudo log: cat /var/log/sudo/sudo.log (permission denied)
        : sudo cat /var/log/sudo/sudo.log
//
UFW: sudo ufw status

UFW: what ? value:

        sudo ufw allow 8080
        sudo ufw status
        sudo ufw delete allow 8080

//

SSH:    sudo service ssh status
        what ? value:
        sudo lsof -i | grep ssh

(from terminal)
        ssh student@localhost -p 4242
        123qweQWE!@#
check root access..
//
groups cdumais (check cdumais's groups)

sudo adduser [username]

password rules: sudo nano /etc/login.defs
verify password rules : sudo chage -l [username]

create group "evaluating" : sudo addgroup [evaluating]
                          : sudo gpasswd -a [username] [evaluating]
                          : members evaluating
//
        : hostnamectl
modify  : sudo hostnamectl set-hostname [newname]
        : sudo nano /etc/hosts

view partitions : lsblk

LVM: how? what?
//
script:
cron: what
        10 min, how ?
        change to every minute:
        make script stop : cron -r ?
restart server..

"
