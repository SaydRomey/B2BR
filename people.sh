#!/bin/bash

wall -n "
                User/Group/Host
User:
        new user = sudo adduser (full options)
dont use*        = sudo useradd [username](no options)
check all users  = cut -d: -f1 /etc/passwd

        info     = getent passwd [username]
  clear user     = sudo userdel [username]
  clear user     = sudo deluser (asks with text)
 switch user     = su [username] (root is just su)


Group:

   new group     = sudo addgroup [groupname]
   delete group  = groupdel [groupname]

add usr to group = sudo gpasswd -a [username] [groupname]
rem usr from grp = sudo gpasswd -d [username] [groupname]

list usr's group = groups [username]
list all groups  = getent group
group members    = getent group [groupname]
group members    = members [groupname]


Host:

            info = hostnamectl
change hostname  = sudo hostnamectl set-hostname [newname]
change hostname  = sudo nano /etc/hosts

"
