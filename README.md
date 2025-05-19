# 🛠️ Born2beroot - Debian Installation Guide

This document provides a complete step-by-step walkthrough to create and configure a **Debian VM** for the **Born2beroot** project.

---

# Born2beroot - Debian Installation Guide

---

## **Create your Debian VM**

---

### 1. Press **New**

- **Unattended Guest OS:**
  - **User**: `xalves`
  - **Password**: `debian123`
  - **Hostname**: `xalves42`

---

### 2. Virtual Machine Name and Operating System

- **Name**: `Born2beRoot`
- **Machine Folder**: `/home/<your_intra_username>/sgoinfre/Born2beRoot/`  
  > _Recommendation_: Create the `Born2beRoot` folder if it doesn’t exist.
- **ISO Image**: Choose your `debian.iso` file (place it in the `sgoinfre` folder).
- Check **"Skip Unattended Installation"**
- **Type**: `Linux`
- **Version**: `Debian (64-bit)`  
  (These fields are usually auto-filled after selecting the ISO image)

> Click **Continue/Next**

---

### 3. Hardware

- **Base Memory**: `1024 MB`
- **Processors**: `1 CPU`
- Uncheck **"Enable EFI"**

> Click **Continue/Next**

---

### 4. Virtual Hard Disk

- **Disk Size**: `8.00 GB`
- Leave other settings at default

> Click **Continue/Next**

---

### 5. Summary

- Verify all configurations

> Click **Finish**

---

## **Setting Up Debian**

---

### 1. Start the VM

#### In the initial Debian menu:
> "Debian GNU/Linux Installer menu (BIOS mode)"

### 2. Select **Install** (Do **not** choose "Graphical install")

---

### Installation Steps

1. **Language**: `English`  
2. **Location**: Choose your region (e.g., `Other -> Europe -> Portugal`)  
3. **Locale**: `United States - en_US.UTF-8`  
4. **Keymap**: `American English`  

---

### 3. Configure the Network

- **Hostname**: `<your_intra_username>42` (e.g., `user42`)
- **Domain name**: _(leave blank)_

---

### 4. Set Up Users and Passwords

#### Root Password:
> Must contain:
- 1 uppercase character
- 1 lowercase character
- At least 10 characters

- Example: `FUCKDEBIAn1234`

#### User Setup:
- **Full Name**: (your intra username)
- **Username**: (your intra username)
- **User Password**: (same as root password recommended)

---

### 5. Configure the Clock

- Choose your local timezone

---

### 6. Partition Disks

- Select: **Manual**

#### 1st Partition:

- Select: `SCSI3 (0,0,0) (sda) 8.6 GB ATA VBOX HARDDISK`
- Create new empty partition table: **Yes**
- Select: `pri/log 8.6 GB FREE SPACE` → **Create new partition**
  - **Size**: `500M`
  - **Type**: `Primary`
  - **Location**: `Beginning`
  - **Mount Point**: `/boot`
  - **Done setting up the partition**

#### 2nd Partition:

- Select: Remaining Free Space
- **Create new partition** → `Logical`
- **Mount Point**: **Do not mount it**
- **Done setting up the partition**

---

### 7. Configuring Encrypted Volumes

- Select: **Configure encrypted volumes**
- Confirm: **Yes**
- Select `/dev/sda5` only (deselect `/dev/sda1`)
- Choose: **Finish**
- Confirm erase: **Yes**
- Use the same password as root for encryption

---

### 8. Configure the Logical Volume Manager (LVM)

- Select: **Configure the Logical Volume Manager**
- Confirm changes: **Yes**
- Create volume group:
  - Name: `LVMGroup`
  - Device: `/dev/mapper/sda5_crypt`

---

### 9. Create Logical Volumes

- `root` – 2G
- `swap` – 1024MB
- `home` – 1G
- `var` – 1G
- `srv` – 1G
- `tmp` – 1G
- `var-log` – 1056MB *(type `var-log`, it auto-corrects to `var--log`)*

> Finish LVM configuration

---

### 10. Configure Logical Volume Partitions

1. **home**
   - Use as: `Ext4 journaling`
   - Mount point: `/home`

2. **root**
   - Use as: `Ext4 journaling`
   - Mount point: `/`

3. **srv**
   - Use as: `Ext4 journaling`
   - Mount point: `/srv`

4. **swap**
   - Use as: `swap area`

5. **tmp**
   - Use as: `Ext4 journaling`
   - Mount point: `/tmp`

6. **var**
   - Use as: `Ext4 journaling`
   - Mount point: `/var`

7. **var-log**
   - Use as: `Ext4 journaling`
   - Mount point: `/var/log` (enter manually)

> Finish partitioning and write changes to disk  
> Confirm: **Yes**

---

### 11. Configure Package Manager

- **Scan extra installation media?**: No
- **Mirror country**: your choice
- **Mirror**: `deb.debian.org`
- **HTTP proxy**: leave blank

---

### 12. Popularity-Contest

> Say **NO** to participation

---

### 13. Software Selection

- **Deselect all options**
- Press **Enter** to continue

---

### 14. GRUB Boot Loader

- Install GRUB to primary drive? **Yes**
- Device: `/dev/sda (ata-VBOX_HARDDISK_xxxxx)`

---

### 15. Finish Installation

- Installation complete  
> Select **Continue**

---

Happy hacking! 🔐🐧
