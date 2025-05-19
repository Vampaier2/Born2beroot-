# 🛠️ Born2beroot - Debian Installation Guide

This document provides a complete step-by-step walkthrough to create and configure a **Debian VM** for the **Born2beroot** project.

---

Debian Installation Guide for Virtual Machine
Introduction

This guide will walk you through the process of installing Debian on a Virtual Machine (VM). This setup is ideal for users who are working in a 42 environment, and it focuses on creating and configuring a VM to run Debian, complete with LVM (Logical Volume Management) and encrypted volumes.
Table of Contents

    Create Your Debian VM

    Debian Installation Steps

    Partitioning and Configuration

    Final Steps

1. Create Your Debian VM
1.1 Virtual Machine Setup

    Open VirtualBox and click on New.

    Set the VM Name:

        Name: Born2beRoot

        Machine Folder: /home/<your_intra_username>/sgoinfre/Born2beRoot/ (Create the folder if it doesn’t exist for organization)

    Choose the ISO Image:

        Select the Debian ISO you’ve downloaded.

        Make sure to tick "Skip Unattended Installation" and ensure it is enabled.

    Select the Type and Version:

        Type: Linux

        Version: Debian (64-bit)

1.2 Memory and CPU Settings

    Base Memory: 1024 MB

    Processors: 1 CPU

    EFI: Ignore the "Enable EFI" checkbox

1.3 Hard Disk Setup

    Select Create a Virtual Hard Disk Now and choose:

        Disk Size: 8.00 GB

    File Type: VDI (VirtualBox Disk Image)

    Storage: Dynamically allocated

2. Debian Installation Steps
2.1 Begin Installation

    Start the VM and select Install from the Debian installer menu (Do not select "Graphical install").

    Language: English

    Location: Choose your location (e.g., Portugal or your respective country).

    Configure the keyboard: Choose "American English".

    Configure the network:

        Hostname: <your_intra_username>42 (e.g., user42)

        Leave the domain name blank.

2.2 Users and Passwords

    Root password: Follow password policy (must contain uppercase, lowercase, and be at least 10 characters long). Example: FUCKDEBIAN1234

    User setup:

        Full name: <your_intra_username>

        Username: <your_intra_username>

        User password: Same as root password.

3. Partitioning and Configuration
3.1 Partition the Disks

    Partition setup:

        Select Manual.

        Select SCSI3 (0,0,0) (sda), then create a new empty partition table.

    First Partition:

        Size: 500M, Type: Primary, Location: Beginning.

        Mount point: /boot.

    Second Partition:

        Size: Max available space, Type: Logical.

        Mount point: /.

3.2 Set Up Encryption and LVM

    Encryption setup:

        Select Configure encrypted volumes.

        Make sure to select /dev/sda5 for encryption (keep /dev/sda1 deselected).

        Use the same passphrase as the root password for encryption.

    Logical Volume Manager (LVM):

        Create a volume group named LVMGroup with /dev/mapper/sda5_crypt.

        Create logical volumes for root, swap, home, var, srv, tmp, and var-log.

4. Final Steps
4.1 Configure Package Manager

    Scan installation media: No

    Mirror country: Choose your country (e.g., Australia)

    HTTP proxy: Leave blank.

4.2 Software Selection

    Ensure no software is selected for installation.

4.3 GRUB Installation

    Install GRUB: Yes

    Device: /dev/sda (the primary boot disk)

4.4 Finish Installation

    After GRUB is installed, finish the installation.

    Reboot the system, and the installation will be complete.

Conclusion

Once the installation is complete, you will have a fully functional Debian system running on your Virtual Machine, complete with encrypted partitions and LVM configuration.
