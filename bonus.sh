#!/bin/bash

wall -n "

partitions      : lsblk

wordpress       :localhost:8080

steps;
        cURL (acces URL without brwoser)
                common, cgi, cli, mysql
        PHP8.1
        purged apache2

        lighttpd : sudo systemctl status lighttpd
(
        authorize http traffic (ufw)
        test info.php
enable  FastGCI (binary protocol lighttpd><php)
        http://localhost:8080/info.php

        MariaDB (database manager, based on mysql)
        enable, then secure (mysql_secure_installation)

        Wordpress database with sql commands

        wget (download from webserver)
        tar (to decompress it)

        mv it in /var/www/html/

        modify wordpress config file
        direct wordpress toward MariaDB's database

        change permissions for WP dir, for the www-data user (web server)

        Do a horrible website...

FAIL2BAN

        what:why?

        installed and enabled
        config param : /etc/fail2ban/jail.local
        apply fail2ban to ssh connections
        (set rules under ssh servers)
"

