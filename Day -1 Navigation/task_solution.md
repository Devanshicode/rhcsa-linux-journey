
## Day 1 Task : Config Audit Backup with Structure Preservation

<img width="1280" height="800" alt="day 1 task" src="https://github.com/user-attachments/assets/6bbc9d95-6228-4221-919a-b004173b52d7" />
## Objective: 
### Create a backup of all .conf files modified within last 3 days under /etc , preserve the original directory structure , create a symbolic link for easy access to backup and verify the backup

# Step 1 : Create Backup Directory
## Command
  ### sudo mkdir -p /tmp/audit_backup

## Explanation 
 ### sudo → Run command with administrator privileges.
 ### mkdir → Create a directory.
 ### -p → Create parent directories if they do not already exist.
 ### /tmp/audit_backup → Destination folder for backups

## Purpose
### Creates a dedicated location where configuration files will be stored.













