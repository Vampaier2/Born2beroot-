# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    monitoring.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: xalves <xalves@student.42lisboa.com>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/21 12:48:31 by xalves            #+#    #+#              #
#    Updated: 2025/05/22 15:24:18 by xalves           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

#✅ Use 'grep' when you just need to find lines containing a certain pattern.
#        grep -> is is a Very fast for simple search of Matching lines
#
#✅ Use 'awk' when you need to extract columns, calculate values, or apply complex conditions.
#        awk -> it is Slower for complex logic but more flexible, preferably used for Field-based processing & reporting
#   - Field-based processing means 'awk' can:
#       - Split lines into fields
#       - Access and manipulate those fields
#       - Apply logic and calculations based on field content
arch=$(uname -a)
printf "#Architecture: $arch\n"
# uname -a shows all the detailed information about the system
# Linux xalves42 6.1.0-34-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.135-1 (2025-04-25) x86_64 GNU/Linux
#
# Linux:                                    The kernel name.
# xalves42:                                 The hostname.
# 6.1.0-34-amd64:                           The kernel version.
# 1 SMP PREEMPT_DYNAMIC Debian 6.1.135-1:   The kernel release.
# x86_64:                                   The architecture.
# GNU/Linux:                                The operating system.
#

pcpu=$(cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l)
printf "#CPU physical: $pcpu\n"
# counts the number of physical 'CPUs sockets' on my system
#
# cat /proc/cpuinfo     -> Contains info for each logical processor.
# | grep "physical id"  -> Only show lines containing physical id.
# | sort                -> Sorts the list of physical id values. Duplicates are grouped together.
# | uniq                -> Removes duplicate lines.
# | wc -l               -> Counts the number of lines.
#

vcpu=$(cat /proc/cpuinfo | grep "processor" | sort | uniq | wc -l)
printf "#vCPU: $vcpu\n"
# counts the number of logical processors/(CPU cores/threads) on my system
#
# | grep "processor"
# | sort  This sorts the filtered list of processors.

uram=$(free -m | grep Mem | awk '{print $3}') # gets 3'rd row = Used Memory 
fram=$(free -m | grep Mem | awk '{print $2}') # gets 2'nd row = Total Memory
pram=$(free -m | grep Mem | awk '{print $3/$2 * 100}') # Used/Total Memory * 100 = % of Memory used
printf "#Memory Usage: $uram/$fram%s (%.2f%%)\n" "MB" "$pram"
# free -m : Shows memory usage in MB.
# (%.2f%%) : formats 'pram' to 2 decimal and adds a '%'.

udisk=$(df -h --total | awk END'{print $3}' | cut -d G -f1) # gets 3'rd row = Used Disk Size in GB (without G)
sdisk=$(df -h --total | awk END'{print $2}' | cut -d G -f1) # gets 2'nd row = Total Disk Size in GB (without G)
pdisk=$(df -h --total | awk END'{print $3/$2 * 100}') # Used/Total Disk Size * 100 = % of used Disk Size
printf "#Disk Usage: $udisk/$sdisk%s (%.2f%%)\n" "Gb" "$pdisk"
# df -h --total : disk space usage across all mounted filesystems
# df -> Disk Free
# -h -> Human-readable
# --total -> adds a summary row at the end
# (%.2f%%) : formats 'pram' to 2 decimal and adds a '%'.

cpul=$(mpstat | tail -n 1 | awk '{print 100-$NF}')
printf "#CPU load: %.1f%%\n" "$cpul"
# quick way to calculate total CPU usage
# mpstat -> Reports CPU usage stats since the system started.
# tail -n 1 -> Grabs the last line
# awk '{print 100 - $NF}' -> $NF = "last field". So 100 - 'last field'

boot=$(who -b | awk '{print $3" "$4}')
printf "#Last boot: $boot\n"
# who -b -> display the last system boot time

lvm=$(lsblk | grep "lvm" | wc -l)
# count the number of LVM volumes.
# starts a conditional statement
if [ $lvm -eq 0 ] # lvm is equal to 0. 
then
    printf "#LVM use: no\n"
else
    printf "#LVM use: yes\n"
fi # ends the if block

ctcp=$(ss | grep "tcp" | wc -l)
printf "#Connections TCP: $ctcp %s\n" "ESTABLISHED"
# It is used to display 'network connections'/'listening ports' of the 'tcp' type.

usr=$(users | tr ' ' '\n' | sort | uniq | wc -w)
printf "#User log: $usr\n"
# counts all the users that are currently logged-IN the system.
#tr ' ' '\n'	Converts space-separated names to one per line
#sort	Sorts them alphabetically (needed for uniq)
#uniq	Removes duplicates
#wc -l	Counts the number of unique lines

ip=$(hostname -I | awk '{print $1}')
mac=$(ip address | grep "ether" | awk '{print $2}')
printf "#Network: IP $ip ($mac)\n"
# ip -> The 1'st IP address of your system
# mac -> The MAC addresses (of all network interfaces on your system)

sudo=$(cat /var/log/sudo/sudo.log | grep "COMMAND" | wc -l)
printf "#Sudo: $sudo\n"
# sudo -> the number of commands that were executed with sudo privileges(COMMAND)
