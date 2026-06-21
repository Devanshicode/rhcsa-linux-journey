
# TASK 9 - User Provisioning Script with Logging and Password Policy




<img width="1280" height="800" alt="task - 9 1" src="https://github.com/user-attachments/assets/96b263a8-8fda-4a32-bd62-00a3559c7719" />




<img width="1280" height="800" alt="task - 9 2" src="https://github.com/user-attachments/assets/e9a41d10-ed94-4b3f-9928-c276252419fd" />





## Objective
Add 2 virtual disks to VirtualBox VM. Disk 1: partition into 1GB XFS, mount persistently via /etc/fstab using UUID. Reboot and verify. Disk 2: set up full LVM stack — PV, VG, 500MB LV, XFS, mount. Extend the LV by 300MB while it is mounted and files are open. Verify no data loss.





# Step 1: Create Script File

## Command

```bash
nano user_provision.sh
```

## Explanation

Creates a shell script file using Nano editor.

## Purpose

Used to write the automation script.

---

# Step 2: Add Script Content

```bash
#!/bin/bash

while getopts u:g: flag
do
    case "${flag}" in
        u) username=${OPTARG};;
        g) groupname=${OPTARG};;
    esac
done

LOGFILE="/var/log/user_provision.log"

echo "Starting provisioning for $username" | sudo tee -a $LOGFILE

sudo groupadd -f "$groupname"

sudo useradd -m "$username"

echo "$username:Temp123@" | sudo chpasswd

sudo usermod -aG "$groupname" "$username"

sudo chage -M 30 "$username"

sudo mkdir -p /home/$username/projects
sudo mkdir -p /home/$username/logs
sudo mkdir -p /home/$username/scripts

sudo chown -R $username:$username /home/$username

echo "Provisioned user $username successfully" | sudo tee -a $LOGFILE
```

---

# Script Breakdown

## `#!/bin/bash`

### Explanation

Specifies Bash as the interpreter.

### Purpose

Ensures the script runs using Bash.

---

## `while getopts u:g: flag`

### Explanation

Reads command-line arguments.

### Purpose

Allows user input for username and group name.

---

## `u) username=${OPTARG}`

### Explanation

Stores username argument.

### Purpose

Creates the user with the supplied name.

---

## `g) groupname=${OPTARG}`

### Explanation

Stores group name argument.

### Purpose

Assigns the user to the specified group.

---

## `LOGFILE="/var/log/user_provision.log"`

### Explanation

Defines the log file location.

### Purpose

Stores provisioning activity.

---

## `groupadd -f`

### Explanation

Creates group if it does not already exist.

### Purpose

Ensures the target group exists.

---

## `useradd -m`

### Explanation

Creates user and home directory.

### Purpose

Creates Linux account.

---

## `chpasswd`

### Explanation

Sets temporary password.

### Purpose

Allows first login.

---

## `usermod -aG`

### Explanation

Adds user to supplementary group.

### Purpose

Assigns permissions.

---

## `chage -M 30`

### Explanation

Sets password expiry after 30 days.

### Purpose

Enforces password policy.

---

## `mkdir -p`

### Explanation

Creates directories if missing.

### Purpose

Creates standard user workspace.

Directories created:

```text
/home/username/
├── projects
├── logs
└── scripts
```

---

## `chown -R`

### Explanation

Changes ownership recursively.

### Purpose

Allows user access to created directories.

---

## `tee -a`

### Explanation

Appends messages to log file.

### Purpose

Maintains audit trail.

---

# Step 3: Make Script Executable

## Command

```bash
chmod +x user_provision.sh
```

## Explanation

Adds execute permission.

## Purpose

Allows script execution.

---

# Step 4: Execute Script

## Command

```bash
sudo ./user_provision.sh -u alice -g developers
```

## Explanation

Creates user "alice" and adds her to "developers" group.

## Purpose

Tests provisioning workflow.

---

# Step 5: Provision Multiple Users

## Command

```bash
for user in alice bob charlie
do
    sudo ./user_provision.sh -u $user -g developers
done
```

## Explanation

Runs the script three times.

## Purpose

Automates onboarding for multiple users.

---

# Step 6: Verify User Creation

## Command

```bash
id alice
```

## Explanation

Displays user ID and group membership.

## Purpose

Verify user was created correctly.

---

# Step 7: Verify Home Directory Structure

## Command

```bash
ls -l /home/alice
```

## Purpose

Verify required folders were created.

Expected structure:

```text
projects/
logs/
scripts/
```

---

# Step 8: Verify Password Expiry

## Command

```bash
sudo chage -l alice
```

## Explanation

Lists password aging information.

## Purpose

Verify 30-day password expiry policy.

---

# Step 9: Verify Log File

## Command

```bash
sudo cat /var/log/user_provision.log
```

## Explanation

Displays provisioning log entries.

## Purpose

Confirm actions were recorded.

---

# Step 10: Install ShellCheck

## Ubuntu

```bash
sudo apt install shellcheck -y
```

## RHEL / Rocky Linux

```bash
sudo dnf install ShellCheck -y
```

## Purpose

Install shell script analysis tool.

---

# Step 11: Run ShellCheck

## Command

```bash
shellcheck user_provision.sh
```

## Explanation

Analyzes script for syntax and best-practice issues.

## Purpose

Improve script quality and reliability.





 # Key Learning 



At first I thought adding extra virtual disks in VirtualBox would be the difficult part, but the interesting learning started after that. For the first disk, I created a partition, formatted it with XFS, and mounted it. Everything looked fine until I realized that a normal mount only survives until the next reboot. That is when I learned why production systems use UUIDs inside /etc/fstab instead of device names like /dev/sdb1. Device names can change after a reboot, but UUIDs stay the same. After updating fstab with the UUID and rebooting the VM, the filesystem mounted automatically, which confirmed the persistent configuration was working correctly.

While setting up the second disk, I got a much better understanding of how LVM is layered. The disk first became a Physical Volume (PV), then a Volume Group (VG), and finally a Logical Volume (LV). After creating the LV, formatting it with XFS, and mounting it, I extended the LV by another 300MB while it was still mounted and files were actively present inside it. What surprised me was that Linux allowed the storage expansion without taking the filesystem offline. The logical volume size increased, the XFS filesystem was grown online, and all existing files remained accessible without interruption.

One thing I had to be careful about was keeping the filesystem and logical volume sizes synchronized. Extending only the LV does not automatically make the filesystem use the new space. Running the filesystem growth command after extending the LV was necessary. I also verified the result using tools like lsblk, vgs, lvs, and df -h to ensure the additional space was actually available and no data was lost.

This is very similar to what cloud engineers do in AWS, Azure, and enterprise data centers. When application servers, databases, or log volumes start running out of space, teams often attach new storage, extend LVM volumes, and grow filesystems without shutting down services. Learning how UUID-based mounts and online LVM expansion work is important because these are common tasks in production environments where downtime is expensive and storage needs change frequently.
















 
