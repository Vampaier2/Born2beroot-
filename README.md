# 🛠️ Born2beroot - Debian Installation Guide

This document provides a complete step-by-step walkthrough to create and configure a **Debian VM** for the **Born2beroot** project.

---

## 📦 Create Your Debian VM

### 1. New VM Setup

- **Unattended Guest OS**  
  - User: `xalves`  
  - Password: `debian123`  
  - Hostname: `xalves42`

### 2. VM Name & OS Settings

- **Name:** `Born2beRoot`  
- **Machine Folder:** `home/<your_intra_username>/sgoinfre/Born2beRoot/`  
  (📁 *Recommended: Create the `Born2beRoot` folder beforehand for organization*)
- **ISO Image:** Use the `.iso` Debian installer (recommend placing it in the `sgoinfre` folder)
- ✅ **Check:** "Skip Unattended Installation"

- **Type:** Linux  
- **Version:** Debian (64-bit)

---

### 3. Hardware Settings

- **Base Memory:** 1024 MB  
- **Processors:** 1 CPU  
- ❌ Disable "Enable EFI"

---

### 4. Virtual Hard Disk

- **Disk Size:** 8.00 GB  
- Leave other settings as-is

---

### 5. Final Summary

- ✅ Confirm all settings  
- ✅ Click **Finish**

---

## 🧰 Setting Up Debian

### 1. Boot the VM

- Click **Start**
- Select: `Install` (❗ Do **not** choose "Graphical Install")

---

### 2. Language & Location

- Language: `English`
- Location: your region (e.g., `Other -> Europe -> Portugal`)
- Locale: `United States - en_US.UTF-8`
- Keymap: `American English`

---

### 3. Network Configuration

- Hostname: `<your_intra_username>42` (e.g., `user42`)
- Domain: *(leave blank)*

---

### 4. Set Up Users & Passwords

- **Root password** must include:
  - At least 1 uppercase
  - At least 1 lowercase
  - Minimum 10 characters

- Example: `FUCKDEBIAn1234` (⚠️ Replace with something secure in real usage)

- **User setup:**
  - Full Name: `<your_intra_username>`
  - Username: `<your_intra_username>`
  - User password: same as root password (recommended)

---

### 5. Clock Configuration

- Set your local timezone

---

## 🧱 Partition Disks (Manual)

### 🔹 Partition 1 - Boot

- Device: `SCSI3 (0,0,0) (sda)`
- Create new empty partition table: `Yes`
- Free space: `Create new partition`
  - Size: `500MB`
  - Type: `Primary`
  - Mount Point: `/boot`
- Done setting up this partition

### 🔹 Partition 2 - Encrypted

- Use remaining space
- Type: `Logical`
- Mount Point: `Do not mount`
- Done setting up the partition

---

## 🔐 Configure Encrypted Volumes

- Select: **Configure encrypted volumes**
- Confirm: `Yes`
- Devices to encrypt:  
  - [ ] `/dev/sda1`  
  - [x] `/dev/sda5`
- Confirm and continue
- Wipe: `Yes`
- Encryption passphrase: **same as root password**

---

## 📦 Configure LVM (Logical Volume Manager)

- Create Volume Group: `LVMGroup`
- Select device: `/dev/mapper/sda5_crypt`

---

## 📁 Create Logical Volumes

| Volume Name | Size     |
|-------------|----------|
| root        | 2G       |
| swap        | 1024MB   |
| home        | 1G       |
| var         | 1G       |
| srv         | 1G       |
| tmp         | 1G       |
| var-log     | 1056MB   |

---

## ⚙️ Configure Partitions (Use Ext4 for most)

1. `/home` - LV `home`
2. `/` - LV `root`
3. `/srv` - LV `srv`
4. `swap area` - LV `swap`
5. `/tmp` - LV `tmp`
6. `/var` - LV `var`
7. `/var/log` - LV `var-log` (Enter manually)

✅ Then: **Finish partitioning and write changes to disk**

---

## 🌐 Package Manager Setup

- Scan extra media: `No`
- Mirror Country: choose yours (e.g., `Portugal`)
- Mirror: `deb.debian.org`
- HTTP Proxy: *(leave blank)*

---

## 📉 Popularity-Contest

- **Decline participation** ❌

---

## 🧰 Software Selection

- ❌ **Deselect all** software packages

---

## ⚙️ Install GRUB Bootloader

- Install to primary drive: `Yes`
- Select device: `/dev/sda`

---

## ✅ Finish Installation

- Continue and **reboot**

---

### 🎉 You're done!

> Debian is now installed and fully configured for the **Born2beroot** project!

