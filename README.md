# 🛠️ Born2beroot - Debian Installation Guide

This document provides a complete step-by-step walkthrough to create and configure a **Debian VM** for the **Born2beroot** project.



# 🔷Step 1: Download Debian ISO
## 🔸1. Click here to download Debian ISO -> [debian.iso](https://www.debian.org/index.en.html)

# 🔷Step 2: In the 'Oracle VM' 🖥️📀


## 🔸1. Press: `New`


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

	- Version : Debian (64-bit)|(Usualy this 2 options are automatically disable as soon as you put the Debian 'ISO Image')
	    
   	### Press: `Continue/Next`


## 🔸4. Hardware

-	- Base Memory : 1024 MB
  
	- Processors : 1 CPU
  
	- Ignore the "Enable EFI" Check Box
	
	### Press: `Continue/Next`


## 🔸5. Virtual Hard Disk
 
-	- Disk Size : 8.00 GB
   
	- Ignore everything else
	
	### Press: `Continue/Next`


## 🔸6. Summary
 
- Check if everything is correctly setted up
 	
 	### Press: `Finish`

---
---
# 🔷Step 3: In Debian 🖥️📀



## 🔸1. Sellect: `Start`
 
## 🔸2. In the Initial Debian Menu "Debian GNU/Linux Installer menu (BIOS mode)"

1. Select "Install" (DO NOT SELECT "Graphical install")

2. Select a Language: English

3. Select your location: `<select your location>`  
(mine is Portugal so I'll select: Other → Europe → Portugal)

4. Select: "United States - en_US.UTF-8"

5. Keymap to use: "American English"

6. Configure the network:
- **Hostname:** `<your_intra_username>` + "42" (example: `user42`)
- **Domain name:** *(leave it blank)*

7. Set up users and passwords:

- **Password:**
  - Root password (due to the password policy it must have):
    - At least 1 uppercase character
    - At least 1 lowercase character
    - At least 10 characters total

  - _Due to my frustration with this project, I used:_  
    `FUCKDEBIAn1234`  
    _(This is for clarity; "space" confirms the password, not "enter")_

- **Users:**
  - Full name for the new user: _(I recommend the intra_username)_
  - Username for your account: _(same recommendation)_
  - Password for your account: _(recommend using same as root password)_

		
		
 9 -> Configure the clock
 
 	Chose the clock of your timezone
 	
 	
 10 -> Partitions disks

	Select: "Manual"
	
	-> 1'st Partiction:

		Select: SCSI3 (0,0,0) (sda) 8.6 GB ATA VBOX HARDDISK
		
		Create new empty partition table on this device?: Yes
		
		Select: pri/log 8.6 GB FREE SPACE
		
		How to use this free space: Create a new partition
		
		New partition size: 500M
		
		Type for the new partition: Primary
		
		Location for the new partition: Beginning
		
		Select: Mount point:     /
		Then
		Select: /boot - static files of the boot loader
		Then
		Select: Done setting up the partition
	
	
	-> 2'nd Partiction:

    		Select pri/log 8.1 GB FREE SPACE
    		
    		How to use this free space: Create a new partition
    		
    		New partition size: max
    		
    		Type for the new partition: Logical
    		
    		Select: Mount point:     /
    		Then
    		Select: Do not mount it
    		Then
    		Select: Done setting up the partition


 11 -> Configuring Volumes
 
 	-> 1'st Cofiguration:
 	
	 	Select: Configure encrypted volumes

	    	Write changes to disk and configure encrypted volumes?: Yes
	    	
	    	Encryption configuration actions: Create encrypted volumes
	    	
	    	Devices to encrypt: using to (space) to select/de-select, ensure that:
			[ ] /dev/sda1 is de-selected
			[*] /dev/sda5 is selected
		Then press: "Enter" to confirm selection
			
	    	Select: Done setting up the partitions
	    	
	    	Encryption configuration actions: Finish
	    	
	    	Really erase the data on SCSI1 (0,0,0), partition #5 (sda)?: Yes
	    	
	    	Encryption passphrase: I personaly used the same password we used for Root password.(To avoid forgetting it)


	-> 2'nd Cofiguration:
	
		
    		Select: Configure the Logical Volume Manager
    		
    		Write the changes to disks and configure LVM?: Yes
    		
    		LVM configuration action: Create volume group
    		
    		Volume group name: LVMGroup
    		
    		Devices for th new volume group:
        		[*] /dev/mapper/sda5_crypt is selected
        		[ ] /dev/sda1 is de-selected
        	Then press: "Enter" to confirm selection

	
 12 -> Creating Logical Volumes
 
	-> 1'st Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: root
    		Logical volume size: 2G
    	
    	-> 2'nd Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: swap
    		Logical volume size: 1024MB
    		
    	-> 3'rd Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: home
    		Logical volume size: 1G
	
	-> 4'th Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: var
    		Logical volume size: 1G

	-> 5'th Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: srv
    		Logical volume size: 1G
    		
    	-> 6'th Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: tmp
    		Logical volume size: 1G
    	
    	-> 7'th Creation:
	
    		LVM configuration action: Create logical volume
    		Volume group: LVMGroup
    		Logical volume name: var-log (yes, type only one '-' which will be automatically updated to '--')
    		Logical volume size: 1056MB
    		
--------------->LVM configuration action: Finish
    
    


 13 -> Configuring LV's
 
 	On the menu of "Partition disks"
 	
 	-> 1'st Creation:
		Select the line directly under the line with "LV home" in it.
		
		Select: Use as:         do not use
		
		How to use this partition:      Ext4 journaling file system
		
		Select: Mount point:    none
		Then
		Select: /home - user home directories
		Then
		Select: Done setting up the partition
		
 	-> 2'nd Configuration:
 	
    		Select the line directly under the line with "LV root" in it. (should be: #1 + <partition size>)
    		
    		Select:  Use as:    do not use
    		
    		How to use this partition: Ext4 journaling file system
    		
    		Select: Mount point:   none
    		Then
    		Select: / - the root file system
    		Then
    		Select: Done setting up the partition


	-> 3'rd Configuration:
		
		Select the line directly under the line with "LV srv" in it.

		Select:  Use as:    do not use

		How to use this partition:      Ext4 journaling file system

		Select: Mount point:    none
		Then
		Select: /srv - data for services provided by this system
		Then
		Select: Done setting up the partition


	-> 4'th Configuration:

		Select the line directly under the line with "LV swap" in it.
		
		Select: Use as:         do not use
		
		How to use this partition:      swap area
		Then
		Select: Done setting up the partition

	-> 5'th Configuration:

		Select the line directly under the line with "LV tmp" in it.
		
		Select: Use as:         do not use
		
		How to use this partition:      Ext4 journaling file system
		
		Select: Mount point:    none
		Then
		Select: /tmp - temporary files
		Then
		Select: Done setting up the partition

	-> 6'th Configuration:

		Select the line directly under the line with "LV var" in it.
		
		Select: Use as:         do not use
		
		How to use this partition:      Ext4 journaling file system
		
		Select: Mount point:    none
		Then
		Select: /var - variable data
		Then
		Select: Done setting up the partition

	-> 7'th Configuration:

		Select the line directly under the line with "LV var-log" in it.
		
		Select: Use as:         do not use
		
		How to use this partition:      Ext4 journaling file system
		
		Select: Mount point:    none
		Then
		Select: Enter manually
		Then
		Type: /var/log
		Then
		Select: Done setting up the partition

	When done, Select: Finish partitioning and write changes to disk
	(located on the bottom of the Partitions list)
	
	Write the changes to disk?: Yes


 14 -> Configure the package manager:

	Scan extra installation media?( or it says: another CD or DVD?): No
	
	Debian archive mirror country: (chose your country or closest)
	
	Debian archive mirror: deb.debian.org
	
	HTTP proxy information (blank for none): leave blank


 15 -> Configuring popularity-contest:
 
 	Participate in the package usage survey : SAY NO TO THE SURVEY. NO!!!
 
 
 16 -> Software selection:
 
 	Choose software to install: ensure all items are de-selected
 	Then press: "Enter" to confirm
 
 
 17 -> Configuring grub-pc:
 
    	Install the GRUB boot loader to your primary driver?(or it says: the master boot record?): Yes
    	
    	Device for boot loader installation: /dev/sda (ata-VBOX_HARDDISK_xxxxxxxxxx-xxxxxxxx)

 18 -> [!!] Finish the installation:
 
 	Installation complete: Continue
