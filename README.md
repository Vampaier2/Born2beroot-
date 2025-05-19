# Born2beroot-
Debian Instalation 

***********************************
****** Create your Debian VM ******
***********************************

1 -> Press new

	Unattended Guest OS

	User - xalves
	pass - debian123
	hostname - xalves42


 2 -> Virtual machine Name and Operating System

	Name : Born2beRoot
	Machine Folder: home/<your_intra_username>/sgoinfre/Born2beRoot/ ( I recomend creating the "Born2beRoot" folder if it does not exist. Just for organization purposes)
	ISO Image : (debian.iso you instaled. Recomend putting the instaled .iso on the sgoinfre folder)
	Check Box "Skip Unattended Instalation" make sure it is ticked/Yes
	
	Type : Linux		 |
	Version : Debian (64-bit)|(Usualy this 2 options are automatically disable as soon as you put the Debian 'ISO Image')
	    
	Continue/Next

 3 -> Hardware

	Base Memory : 1024 MB
	Processors : 1 CPU
	Ignore the "Enable EFI" Check Box
	
	Continue/Next
	
 4 -> Virtual Hard Disk
 
 	Disk Size : 8.00 GB
	Ignore everything else
	
	Continue/Next
	
 5 -> Summary
 
 	Check if everything is correctly setted up
 	
 	Press Finish
 	

 
*******************************
****** Setting up Debian ******
*******************************

 1 -> Sellect 'Start'
 
 ****************************************************************************
 -> In the Initial Debian Menu "Debian GNU/Linux Installer menu (BIOS mode)"
 ****************************************************************************
 	
 2 -> Select "Install" (DO NOT SELECT "Graphical install")
 
 3 -> Select a Language : English
 
 4 -> Select your location : <select your location> (mine is Portugal so i'll select Other->Europe->Portugal)

 5 -> Select : "United States - en_US.UTF-8"
 
 6 -> Keymap to use: "American English"
 
 7 -> Configure the network
	Hostname: <your_intra_username> + "42" (example : user42)
	Domain name: leave it blank
	
 8 -> Set up users and passwords
	Password:
		Root password:(due to the password policy it is mandatory for your password tho have:)
				- At least 1 uppercase character
				- At least 1 lowercase character
				- The password must be at least 10 characters long
				
		Due to my anger with this project i've decided to use the password: "FUCKDEBIAn1234"
		(to show the password is 'space' not 'enter' on the check "Show Password in Clear")
	
	Users:
		Full name for the new user: (i recommend the intra_username)
		
		Username for your account: (i recommend the intra_username)
		
		Password for your account: (i recommend the same as Root password)
		
		
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
