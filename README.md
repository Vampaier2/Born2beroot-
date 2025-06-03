# 🛠️ Born2beroot - Debian Installation Guide

This document provides a complete step-by-step walkthrough to create and configure a **Debian VM** for the **Born2beroot** project.
---
# 📚 Table of Contents

- 🔷 Step 1: [Download Debian ISO](#step-1-download-debian-iso)  
- 🔷 Step 2: [In the 'Oracle VM'](#step-2-in-the-oracle-vm) 🖥️📀
- 🔷 Step 3: [In Debian](#step-3-in-debian) 🖥️📀
- 🔷 Step 4: [Inside Debian Terminal](#step-4-inside-debian-terminal) 🖥️
- 🔷 Step 5: [Evaluation](#step-5-evaluation) ⚖️📝✍️🧐


---

# 🔷Step 1: Download Debian ISO
## 🔸1. Click here to download Debian ISO. 👉 [debian.iso](https://www.debian.org/index.en.html)

# 🔷Step 2: In the 'Oracle VM'


## 🔸1. 👉Press: `New`


## 🔸2. Unattended Guest OS

-	- User: xalves  
 
	- Password: debian123
 
	- Hostname: xalves42
  

## 🔸3. Virtual machine Name and Operating System

-	- Name : Born2beRoot

	- Machine Folder: home/<your_intra_username>/sgoinfre/Born2beRoot/ ( I recomend creating the "Born2beRoot" folder if it does not exist. Just for organization purposes)

	- ISO Image : (debian.iso you instaled. Recomend putting the instaled .iso on the sgoinfre folder)

		- [x] "Skip Unattended Instalation" (make sure it is ticked/Yes)
	
	- Type : Linux

	- Version : Debian (64-bit)
   
 	 (Usualy this 2 options are automatically disable as soon as you put the Debian 'ISO Image')
	    
   	### 👉Press: `Continue/Next`


## 🔸4. Hardware

-	- Base Memory : 1024 MB
  
	- Processors : 1 CPU
  
	- Ignore the "Enable EFI" Check Box
	
	### 👉Press: `Continue/Next`


## 🔸5. Virtual Hard Disk
 
-	- Disk Size : 8.00 GB
   
	- Ignore everything else
	
	### 👉Press: `Continue/Next`


## 🔸6. Summary
 
- Check if everything is correctly setted up
 	
 	### 👉Press: `Finish`

---
---
# 🔷Step 3: In Debian



## 🔸1. Sellect: `Start`
 
## 🔸2. In the Initial Debian Menu "Debian GNU/Linux Installer menu (BIOS mode)"

1. **Select:** "Install" (DO NOT SELECT "Graphical install")

2. **Select a Language:** English

3. **Select your location:** `<select your location>`  
(mine is Portugal so I'll select: Other → Europe → Portugal)

4. **Select:** "United States - en_US.UTF-8"

5. **Keymap to use:** "American English"

6. **Configure the network:**
- **Hostname:** `<your_intra_username>` + "42" (example: `user42`, DELETE the DEBIAN before it)
- **Domain name:** *(leave it blank)*

7. **Set up users and passwords**:

- **Password:**
  - Root password (due to the password policy it must have):
    - At least 1 uppercase character
    - At least 1 lowercase character
    - At least 10 characters total

  - Due to my frustration with this project, I used:`FUCKDEBIAn1234`  
    _(Note: "space" confirms the password, not "enter")_

- **Users:**
  - Full name for the new user: _(I recommend the intra_username)_
  - Username for your account: _(same recommendation)_
  - Password for your account: _(recommend using same as root password)_

		
		
8. Configure the clock
 
 	Chose the clock of your timezone
 	
 	
## 🔸3. Partitions disks

### 👉 Select: `Manual`
	
### _**1st Partition:**_

⬇️ Step 1: **Select:** SCSI3 (0,0,0) (sda) 8.6 GB ATA VBOX HARDDISK  
⬇️ Step 2: **Create** new empty partition table on this device? → Yes  
⬇️ Step 3: **Select:** pri/log 8.6 GB FREE SPACE  
⬇️ Step 4: **How to use this free space:** `Create a new partition`

⬇️ Step 5: **New partition size:** 500M  
⬇️ Step 6: **Type for the new partition:** Primary  
⬇️ Step 7: **Location for the new partition:** Beginning


⬇️ Step 8:
- **Select:** `Mount point:   /  `
  
	🔽 Then
- **Select:** `/boot - static files of the boot loader`
  
	🔽 Then
- **Select:** `Done setting up the partition`

---

### _**2nd Partition:**_

⬇️ Step 1: **Select:** pri/log 8.1 GB FREE SPACE  
⬇️ Step 2: **How to use this free space:** `Create a new partition`  
⬇️ Step 3: **New partition size:** max  
⬇️ Step 4: **Type for the new partition:** Logical  
⬇️ Step 5:
- **Select:** `Mount point:   /  `

  	🔽 Then  
- **Select:** `Do not mount it`

  	🔽 Then  
- **Select:** `Done setting up the partition`


## 🔸4. Configuring Volumes
 
### _**1'st Cofiguration:**_
 	
1. **Select:** Configure encrypted volumes

2. **Write changes to disk and configure encrypted volumes?:** Yes
	    	
3. **Encryption configuration actions:** Create encrypted volumes
	    	
4. **Devices to encrypt: using to (space) to select/de-select, ensure that:**
   
	- [ ] /dev/sda1 |is **de-selected**

	- [x] /dev/sda5 |is **selected**

6. **Then press:** "Enter" to confirm selection
			
7. **Select:** Done setting up the partitions
	    	
8. **Encryption configuration actions:** Finish
	    	
9. **Really erase the data on SCSI1 (0,0,0), partition #5 (sda)?:** Yes
	    	
10. **Encryption passphrase:** I personaly used the same password we used for Root password.(To avoid forgetting it)

---

### _**2'nd Cofiguration:**_
		
1. **Select:** Configure the Logical Volume Manager
    		
2. **Write the changes to disks and configure LVM?:** Yes
    		
3. **LVM configuration action: Create volume group:**
    		
   - **Volume group name:** LVMGroup
    		
   - **Devices for th new volume group:**

   		- [x] /dev/mapper/sda5_crypt	|is **selected**
   
        - [ ] /dev/sda1 			|is **de-selected**
   
   - **Then press:** "Enter" to confirm selection

	
## 🔸5. Creating Logical Volumes

### _**1'st Creation:**_
- LVM configuration action: Create logical volume
	- Volume group: LVMGroup
	- Logical volume name: root
	- Logical volume size: 2G
---    	
### _**2'nd Creation:**_
- **LVM configuration action:** Create logical volume  
  - **Volume group:** LVMGroup  
  - **Logical volume name:** swap  
  - **Logical volume size:** 1024MB
---
### _**3'rd Creation:**_
- **LVM configuration action:** Create logical volume  
  - **Volume group:** LVMGroup  
  - **Logical volume name:** home  
  - **Logical volume size:** 1G
---
### _**4'th Creation:**_
- **LVM configuration action:** Create logical volume  
  - **Volume group:** LVMGroup  
  - **Logical volume name:** var  
  - **Logical volume size:** 1G
---
### _**5'th Creation:**_
- **LVM configuration action:** Create logical volume  
  - **Volume group:** LVMGroup  
  - **Logical volume name:** srv  
  - **Logical volume size:** 1G
---
### _**6'th Creation:**_
- **LVM configuration action:** Create logical volume  
  - **Volume group:** LVMGroup  
  - **Logical volume name:** tmp  
  - **Logical volume size:** 1G
---
### _**7'th Creation:**_
- **LVM configuration action:** Create logical volume  
  - **Volume group:** LVMGroup  
  - **Logical volume name:** var-log  
    *(yes, type only one '-' which will be automatically updated to '--')*  
  - **Logical volume size:** 1056MB

      
- **Then Select:** LVM configuration action: Finish
    


## 🔸6. Configuring LV's
 
### On the menu of "Partition disks"

### _**1'st Creation:**_

- **Select the line directly under the line with `LV home` in it.**

- **Select:** `Use as:         do not use`

- **How to use this partition:**       `Ext4 journaling file system`

- **Select:** `Mount point:    none`

	🔽 Then
- **Select:** `/home - user home directories`
  
	🔽 Then
- **Select:** `Done setting up the partition`

---
### _**2'nd Configuration:**_

- **Select the line directly under the line with `LV root` in it.** (should be: #1 + <partition size>)  
- **Select:** `Use as:    do not use`  
- **How to use this partition:** `Ext4 journaling file system`  
- **Select:** `Mount point:   none`  

  🔽 Then  
- **Select:** `/ - the root file system`  

  🔽 Then  
- **Select:** `Done setting up the partition`

---
### _**3'rd Configuration:**_

- **Select the line directly under the line with `LV srv` in it.**  
- **Select:** `Use as:    do not use`  
- **How to use this partition:** `Ext4 journaling file system`  
- **Select:** `Mount point:    none`  

  🔽 Then  
- **Select:** `/srv - data for services provided by this system`  

  🔽 Then  
- **Select:** `Done setting up the partition`

---
### _**4'th Configuration:**_

- **Select the line directly under the line with `LV swap` in it.**  
- **Select:** `Use as:         do not use`  
- **How to use this partition:** `swap area`  

  🔽 Then  
- **Select:** `Done setting up the partition`

---
### _**5'th Configuration:**_

- **Select the line directly under the line with `LV tmp` in it.**  
- **Select:** `Use as:         do not use`  
- **How to use this partition:** `Ext4 journaling file system`  
- **Select:** `Mount point:    none`  

  🔽 Then  
- **Select:** `/tmp - temporary files`  

  🔽 Then  
- **Select:** `Done setting up the partition`

---
### _**6'th Configuration:**_

- **Select the line directly under the line with `LV var` in it.**  
- **Select:** `Use as:         do not use`  
- **How to use this partition:** `Ext4 journaling file system`  
- **Select:** `Mount point:    none`  

  🔽 Then  
- **Select:** `/var - variable data`  

  🔽 Then  
- **Select:** `Done setting up the partition`

---
### _**7'th Configuration:**_

- **Select the line directly under the line with `LV var-log` in it.**  
- **Select:** `Use as:         do not use`  
- **How to use this partition:** `Ext4 journaling file system`  
- **Select:** `Mount point:    none`  

  🔽 Then  
- **Select:** `Enter manually`  

  🔽 Then  
- **Type:** `/var/log`  

  🔽 Then  
- **Select:** `Done setting up the partition`

---
**When done, Select:** `Finish partitioning and write changes to disk`

(located on the bottom of the Partitions list)

**Write the changes to disk?:** `Yes`

---

## 🔸7. Configure the package manager:

- **Scan extra installation media?( or it says: another CD or DVD?):** `No`
	
- **Debian archive mirror country:** (chose your country or closest)
	
- **Debian archive mirror:** `deb.debian.org`
	
- **HTTP proxy information (blank for none):** `leave blank`

- **Participate in the package usage survey:** `SAY NO TO THE SURVEY. NO!!!`
 
 
## 🔸8. Software selection:
 
- **Choose software to install:** ensure all items are de-selected

- **Then press:** "Enter" to confirm 
 
## 🔸9. Configuring grub-pc:
 
- **Install the GRUB boot loader to your primary driver?(or it says: the master boot record?):** `Yes`
    	
- **Device for boot loader installation:** `/dev/sda (ata-VBOX_HARDDISK_xxxxxxxxxx-xxxxxxxx)`

## 🔸10. [!!] Finish the installation:


---
---
# 🔷Step 4: Inside Debian Terminal

## 🔸Vim tips:

- `i` -> insert mode
- `esc` -> exit insert mode
- `:wq` -> save and exit Vim
- `:q!` -> exit without saving
- `/<word>` -> searches for the word (AKA `Ctr+F`)
 
 
 
## 🔸First things to setup and sudo install

- `lsblk` terminal to see partitions -> + Shows hard disks, SSDs, USB drives, and partitions.
- login as root or use `su -` to enter as root
- `apt-get update -y` -> updates the package list
- `apt-get upgrade -y` -> upgrades all installed packages to the latest versions
- `apt-get install sudo` -> installs the sudo package
- `sudo apt-get install git` -> This installs Git
- `sudo apt-get install vim` -> This installs Vim

 	
 	
## 🔸Connect to SSH

- `sudo apt-get install openssh-server` -> This installs the OpenSSH server
- `sudo systemctl status ssh` or `sudo service sshd status` to check status of ssh
- `sudo vim /etc/ssh/sshd_config`
- Remove comment from `#Port22` and change it to `Port 4242`
- Recome comment from `#PermitRootLogin prohibit-password` and change it to `PermitRootLogin no`
- `sudo systemctl restart ssh` to restart ssh after the changes



## 🔸Install UFW (Uncomplicated Firewall)

- `sudo apt-get install ufw` -> Installs UFW (Uncomplicated Firewall)
- `sudo ufw enable` (to turn it on)
- `sudo ufw disable` (to turn if off)
- `sudo ufw status numbered` (show status of ufw and allowed ports)
- `sudo ufw allow 4242` (allow port 4242)
- `sudo ufw delete <port_number>`(to delete an allowed port)
- `sudo ufw delete allow 8080` delete everything from the allow (both instances)
- `sudo ufw deny 8080` (deny port 8080)

 
 
## 🔸Connect to the VM via Terminal
 
- go to the VM Box, `Settings`, `Network`, change `NAT` to `Bridged Adapter`
- `sudo reboot` to reboot the VM
- in the VM use `hostname -I` to get your IP
- in the Terminal of your PC(not on the VM), type `ssh <username>@<VM IP> -p 4242`

    
    
## 🔸Arranging Groups
 
- use `sudo addgroup user42` (to create a group named "user42")
- `sudo usermod -aG sudo,user42 <username>` (to add your user to both groups)
- `getent group sudo` or `getent group user42` (to check who is in the group)

## 🔸Creating sudo.log
 
- `cd /var/log`
- `mkdir sudo`
- `cd sudo`
- `touch sudo.log`
- `chmod 644 sudo.log`


## 🔸Password Max and Min Days
 
- `sudo vim /etc/login.defs` go to line 165, or search for PASS_MAX_DAYS
- set `PASS_MAX_DAYS` to 30 | `PASS_MAX_DAYS` -> Maximum number of days a password may be used.
- set `PASS_MIN_DAYS` to 2  | `PASS_MIN_DAYS` -> Minimum number of days allowed between password changes.
			| `PASS_WARN_AGE` -> Number of days warning given before a password expires.
- use `chage -M 30 <username>` (apply MAX rule to the user)
- use `chage -m 2 <username>` (apply MIN rule to the user)
- REMEMBER TO EXECUTE BOTH COMMANDS FOR ROOT AS WELL !
- use `chage -l <username>` to check if both and root have the 30 MAX and 2 MIN set
- you can use `passwd <username>` to change your password, if you wish.



## 🔸Password Quality 
 
- While on root do: `sudo apt-get install libpam-pwquality` -> Installs libpam-pwquality package, which enhances password security by enforcing strong password policies through PAM (Pluggable Authentication Modules)
- In `sudo vim /etc/pam.d/common-password` you need to add a few commands after `retry=3:`
- `maxrepeat=3` (maximum of 3 characters can be repeated in a row)
- `minlen=10` (minimum 10 characters on the password)
- `ucredit=-1` lcredit=-1 dcredit=-1 (to force at least one uppercase, lowercase and digit in password)
- `difok=7` (password must have at least 7 different characters from last password)
- `reject_username` (no username allowed on password)
- `enforce_for_root` (add the rule to root user as well)

save and exit, then after it use:
- `sudo reboot` to reboot the VM


## 🔸Sudo Visudo
 
- use `sudo visudo`
- Gotta add a list of things, at the beginning below Defaults  `secure_path`
- `Defaults  badpass_message="Wrong Password!"`
- `Defaults  passwd_tries=3`
- `Defaults  iolog_dir="/var/log/sudo"`
- `Defaults  logfile="/var/log/sudo/sudo.log"`
- `Defaults  log_input`
- `Defaults  log_output`
- `Defaults  requiretty`
- go to the line where there is `root  ALL=(ALL:ALL) ALL` -> grants the **root** user permission to run any command, as any user, and from any host, without any restrictions.
- put bellow it `<username>  ALL=(ALL:ALL) ALL`
- To exit and save do: `Ctrl + X`, `Y`, `Enter`.


## 🔸Crontab

- `sudo crontab -e` -> allows you to edit the root user's **`cron jobs`**.
  - **Cron Jobs** are used to automate tasks like system backups, updates, or custom scripts that need to run at specific times
- in the first line of the file, type this: `*/10 * * * * bash <path to your script here>`
- So in my case `*/10 * * * * bash /usr/local/bin/monitoring.sh | wall`
  - `wall` - shows on all open termminals at the time of execution. (I do pipe `wall`, because I don't have it in my monitoring script)
- Crontab has 5 fields and they refer to: (minutes) (hour) (days) (month) (day_of_the_week)
- `*/10` means in an interval of **every 10 minutes**. if we placed only 10, if would mean in the 10th minute of every hour

    
- **Installation complete:** `Continue`


## 🔸Monitoring script
- first we need to install two things `sudo apt-get install bc sysstat` -> This command installs two tools: `bc` and `sysstat`
  - `bc` -> A utility for performing arbitrary-precision arithmetic (performing calculations with floating-point numbers).
  - `sysstat` -> A package that contains system monitoring tools such as sar, iostat, and mpstat for tracking system performance.
- the script need to use `wall` to send it to all terminals, you can use wall in your script, or pipe it to wall in the crontab
- `cd /usr/local/bin`
- `vim monitoring.sh`
- `chmod 755 monitoring.sh` -> give **`all permisions`** to the owner, and give only **`Read`** and **`Execute`** to everyone else
- this is my current [monitoring.sh](https://github.com/Vampaier2/Born2beroot-/blob/main/monitoring.sh) 



---
---
# 🔷Step 5: Evaluation
# ⚖️📝✍️🧐

## 🔸Mandatory Part:

Delivering
- sha1sum <Born2beRoot.vdi>
---
## General instructions

Compare the "signature.txt" file with the ".vdi" file of the virtual machine.
(A simple "diff" should allow you to compare the two signatures.)
---
# Mandatory part:

## Project overview

The student being evaluated should explain to you simply:

1. How a virtual machine works?
- A `virtual machine (VM)` is software that runs an operating system inside another system, acting like a separate computer.

2. Their choice of operating system?
- I chose `Debian` because it is highly recommended if you are new to system administration.

3. The basic differences between Rocky and Debian?
- `Rocky` is more a system for enterprise servers.
- `Debian` is a universal OS known for stability and flexibility.

4. The purpose of virtual machines?
- A `VM` lets you run multiple isolated systems on one physical computer, improving efficiency, security, and flexibility.

5. Debian: the difference between aptitude and apt?
- `apt` -> Best for quick, everyday package management.
- `aptitude` -> Best for Complex package issues, dependency conflicts, interactive use.
During the defense, a script must display information every 10 minutes.

6. What is APPArmor?
- `AppArmor` -> protects your system by limiting what applications can access

## Simple setup

1. Ensure that the machine does not have a graphical environment at launch. 
- `ls /usr/bin/*session` (if it only shows 1 it means you don't have a graphical environment so, you good 👍)

A password will be required before attempting to connect to this machine. Finally, connect with a user with the help of the student being evaluated. This user must not be root. Pay attention to the password chosen, it must follow the rules imposed in the subject.

2. Check that the UFW service is started.
- `sudo systemctl status ufw`

3. Check that the SSH service is started.
- `sudo systemctl status ssh`

4. Check that the chosen operating system is Debian or Rocky.
- `uname -a`

## User

1. The subject requires that a user with the login of the student being evaluated exists on the virtual machine. Check that it has been added and that it belongs to the
"sudo" and "user42" groups.
- `getent group sudo`.
- `getent group user42`.

2. Make sure the rules imposed in the subject concerning the password policy have been put in place.
- `sudo vim /etc/pam.d/common-password`

3. First, create a new user, assign it a password of your choice, respecting the rules. 
- (create user) `sudo adduser <username>` (to remove is `sudo userdel -r <username>`)

4. Now that you have a new user, create a group named "evaluating" in front of you and assign it to this user.
- (create group) `sudo addgroup <groupname>` (to remove group is `sudo groupdel <groupname>`)
- (assign user to group) `sudo adduser <username> <groupname>`

5. Finally, check that this user belongs to the "evaluating" group.
- `getent group <created user>`

6. Explain the advantages and disadvantages of the password policy.
6.1. Advantages:
- Makes the password is More Safe & harder to crack

6.2. Disadvantages:
- It makes the user have to remeber hard complex passwords(especially when managing multiple users)


## Hostname and partitions

1. Check that the hostname of the machine is correctly formatted as follows: login42 (login of the student being evaluated).
- `hostname`

2. Modify this hostname, then restart the machine.
- `sudo hostnamectl set-hostname <newhostname>`(this is just the name of the pc it can be anything)
then
- `sudo reboot`

3. You can now change the hostname to the original hostname you had before.
- `sudo hostnamectl set-hostname <oldhostname>`(this is the name you had before)

4. Ask the student being evaluated how to view the partitions for this virtual machine.
- `lsblk`

5. Compare the output with the example given in the subject. Please note: if the student being evaluated completes the bonuses, it will be necessary to refer to the bonus example.

6. The student being evaluated should give you a brief explanation of how LVM works and what it is all about/explain partitions.

- `(/) (root directory)`
	- Purpose: The main system partition, contains core OS (files, binaries, libraries, etc...)

- `([SWAP]) (swap space)`
        - Purpose: Acts as virtual memory, used when RAM is full. Helps prevent crashes, but is slower than RAM.

- `(/home) (user data directory)`
        - Purpose: Stores user files, settings, and personal data. (Keeps user data separate from system files.)

- `(/var) (variable data directory)`
        - Purpose: Stores variable files such as caches, and logs.

- `(/srv) (service data directory)`
        - Purpose: Contains data for services like web or FTP servers. (Keeps server content separate from system files.)

- `(/tmp) (temporary files directory)`
        - Purpose: Holds temporary files. (Usually cleared at reboot.)

- `(/var/log) (log files directory)`
        - Purpose: Stores system and application log files.

## SUDO

1. Check that the "sudo" program is properly installed on the virtual machine.
- `sudo --version`

2. The student being evaluated should now show assigning your 'new user' to the "sudo" group.
- (assign 'new user' to group) `sudo adduser <username> sudo`

3. Must first explain the value and operation of sudo using examples of their choice. 
- `sudo apt update` (This command updates the package list, but it requires administrative privileges)

4. Show the implementation of the rules imposed by the subject.
- `sudo visudo`

5. Verify that the "/var/log/sudo/" folder exists and has at least one file. 
- `sudo ls /var/log/sudo`

6. Check the contents of the files in this folder. (You should see a history of the commands used with sudo.) 
- `sudo cat /var/log/sudo/sudo.log`

7. Finally, try to run a command via sudo. 
- `sudo echo "sudo is working"` (to test the sudo)

8. See if the file (s) in the "/var/log/sudo/" folder have been updated.
- `sudo cat /var/log/sudo/sudo.log`

## UFW / Firewalld

1. Check that the "UFW" (or "Firewalld" for rocky) program is properly installed on the virtual machine.
- `sudo systemctl status ufw`

2. Check that it is working properly.
- `sudo ufw deny 4242` (remember to switch back to 'allow': sudo ufw allow 4242)

3. The student being evaluated should provide a basic explanation of what UFW (or Firewalld) is.
- UFW stands for 'Uncomplicated Firewall'. It is a user-friendly interface for managing a firewall in Linux.

4. List the active rules in UFW. A rule must exist for port 4242.
- `sudo ufw status`

5. Add a new rule to open port 8080. Check that this one has been added by listing the active rules.
- `sudo ufw allow 8080` (Add a new port for 8080)

6. Finally, delete this new rule.
- `sudo ufw delete allow 8080` (allow ou deny, depends on what status say)


## SSH

1. Check that the SSH service is properly installed on the virtual machine, and Check that it is working properly.
- `sudo systemctl status ssh`

2. Explain basically what SSH is and the value of using it.
- SSH or 'Secure Shell'. It is a network protocol that allows you to securely connect to another computer over a network, typically the internet.

3. Verify that the SSH service only uses port 4242 in the virtual machine.
- `sudo vim /etc/ssh/sshd_config`

4. The student being evaluated should help you use SSH in order to log in with the newly created user.
- `ssh <username>@<VM IP> -p 4242`

5. Of course, you have to make sure that you cannot use SSH with the "root" user as stated in the subject.
- `ssh <root>@<VM IP> -p 4242`


## Script monitoring

The student being evaluated should explain to you simply:

1. How their script works by showing you the code.
- `vim /usr/local/bin/monitoring.sh (then explain code)`

2. What "cron" is.
- cron runs commands or scripts automatically at scheduled times or intervals.

3. See how the script is runing every 10 minutes.
- `sudo crontab  -e`

4. Now change the script so it runs every minute.
- `sudo crontab  -e`

## Bonus

Check the bonus points authorized for this project:
- Setting up partitions is worth 2 points.
