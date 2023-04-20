#!/bin/bash

#Architecture of os and kernel version
arch=$(uname -mrs)#!/bin/bash

#Architecture of os and kernel version
arch=$(uname -mrs)

#Number of physical processors (CPU)
pcpu=$(grep "physical id" /proc/cpuinfo | sort | uniq | wc -l)

#Number of virtual processors (vCPU)
vcpu=$(grep "^processor" /proc/cpuinfo | wc -l)

#Current available RAM on server and utilization rate as a percentage
fram=$(free -m | awk '$1 == "Mem:" {print $2}')
uram=$(free -m | awk '$1 == "Mem:" {print $3}')
pram=$(free | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

#Current available memory on server and utilization rate as a percentage
fdisk=$(df -Bg | grep '^/dev/' | grep -v '/boot$' | awk '{ft += $2} END {print ft}')
udisk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} END {print ut}')
pdisk=$(df -Bm | grep '^/dev/' | grep -v '/boot$' | awk '{ut += $3} {ft += $2} END >

#Current utilization rate of processors as a percentage (CPU load)
cpul=$(top -bn1 | grep '^%Cpu' | cut -c 9- | xargs | awk '{printf("%.1f%%"), $1 + $>

#Date and time of the last reboot
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')

#Is LVM active or not
lvmt=$(lsblk | grep "lvm" | wc -l)
lvmu=$(if [ $lvmt -eq 0 ]; then echo disabled; else echo enabled; fi)

#Number of active connections (TCP)
ctcp=$(cat /proc/net/sockstat{,6} | awk '$1 == "TCP:" {print $3}')

#Number of users using the server
ulog=$(users | wc -w)

#IPv4 adress of the server and its MAC (Media Access Control) adress
ip=$(hostname -I)
mac=$(ip link show | awk '$1 == "link/ether" {print $2}')

#Number of commands executed with the sudo program
cmds=$(journalctl _COMM=sudo | grep COMMAND | wc -l)


echo -e "\nInfo update from $(whoami)@$(hostname)\n"
echo -e "#Architecture: $arch"
echo -e "#Physical CPU: $pcpu"
echo -e "#Virtual CPU: $vcpu"
echo -e "#Ram usage: $uram/${fram}Mb ($pram%)"
echo -e "#Disk memory: $udisk/${fdisk}Gb ($pdisk%)"
echo -e "#CPU load: $cpul"
echo -e "#Last boot: $lb"
echo -e "#LVM is $lvmu"
echo -e "#TCP connections:$ctcp"
echo -e "#User log: $ulog"
echo -e "#Network: IP $ip ($mac)"
echo -e "#Sudo: $cmds cmd"
echo -e "\n($(date))"
