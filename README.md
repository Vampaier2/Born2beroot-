# 🛠️ Born2beroot - Debian Installation Guide

This document provides a complete step-by-step walkthrough to create and configure a **Debian VM** for the **Born2beroot** project.



# 🔷Step 1: Download Debian ISO
## 🔸1. Click here to download Debian ISO. 👉 [debian.iso](https://www.debian.org/index.en.html)

# 🔷Step 2: In the 'Oracle VM' 🖥️📀


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

	- Version : Debian (64-bit)|(Usualy this 2 options are automatically disable as soon as you put the Debian 'ISO Image')
	    
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
# 🔷Step 3: In Debian 🖥️📀



## 🔸1. Sellect: `Start`
 
## 🔸2. In the Initial Debian Menu "Debian GNU/Linux Installer menu (BIOS mode)"

1. **Select:** "Install" (DO NOT SELECT "Graphical install")

2. **Select a Language:** English

3. **Select your location:** `<select your location>`  
(mine is Portugal so I'll select: Other → Europe → Portugal)

4. **Select:** "United States - en_US.UTF-8"

5. **Keymap to use:** "American English"

6. **Configure the network:**
- **Hostname:** `<your_intra_username>` + "42" (example: `user42`)
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
 
- **Installation complete:** `Continue`
