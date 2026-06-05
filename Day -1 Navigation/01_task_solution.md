
## Day 1 Task : Config Audit Backup with Structure Preservation

<img width="1280" height="800" alt="day 1 task" src="https://github.com/user-attachments/assets/6bbc9d95-6228-4221-919a-b004173b52d7" />


## Objective

Create a backup of all .conf files modified within the last 3 days under /etc, preserve the original directory structure, create a symbolic link to the backup, and verify the backup.

---

## Step 1: Create Backup Directory

### Command

```bash
sudo mkdir -p /tmp/audit_backup
```

### Explanation

* `sudo` → Run command with administrator privileges.
* `mkdir` → Create a directory.
* `-p` → Create parent directories if they do not already exist.
* `/tmp/audit_backup` → Destination folder for backups.

### Purpose

Creates a dedicated location where configuration files will be stored.

---

## Step 2: Simulate Recent File Changes

### Command

```bash
sudo touch /etc/hostname /etc/hosts
```

### Explanation

* `touch` → Updates the modification timestamp of existing files.
* `/etc/hostname` and `/etc/hosts` → System files used for hostname configuration.

### Purpose

Ensures that the system contains recently modified files for testing.

---

## Step 3: Find Recently Modified Configuration Files

### Command

```bash
sudo find /etc -name '*.conf' -mtime -3
```

### Explanation

* `find` → Search for files.
* `/etc` → Starting directory.
* `-name '*.conf'` → Search only for files ending with `.conf`.
* `-mtime -3` → Files modified within the last 3 days.

### Purpose

Displays all matching configuration files before copying them.

---

## Step 4: Copy Files While Preserving Directory Structure

### Command

```bash
sudo find /etc -name '*.conf' -mtime -3 -exec cp --parents {} /tmp/audit_backup/ \;
```

### Explanation

* `-exec` → Execute a command for each file found.
* `cp` → Copy files.
* `--parents` → Preserve the original directory structure.
* `{}` → Represents the current file found by `find`.
* `/tmp/audit_backup/` → Backup destination.
* `\;` → Terminates the `-exec` command.

### Purpose

Copies matching files while keeping their original path structure.

### Example

Original file:

```text
/etc/modprobe.d/tuned.conf
```

Copied as:

```text
/tmp/audit_backup/etc/modprobe.d/tuned.conf
```

---

## Step 5: Verify Backup Structure

### Command

```bash
tree /tmp/audit_backup
```

### Explanation

* `tree` → Displays directories and files in a tree-like structure.

### Purpose

Confirms that files were copied correctly and directory hierarchy was preserved.

### Sample Output

```text
/tmp/audit_backup
└── etc
    ├── cups
    │   └── subscriptions.conf
    ├── modprobe.d
    │   └── tuned.conf
    └── resolv.conf
```

---

## Step 6: Create a Symbolic Link

### Command

```bash
sudo ln -s /tmp/audit_backup /root/latest_audit
```

### Explanation

* `ln` → Create links.
* `-s` → Create a symbolic (soft) link.
* `/tmp/audit_backup` → Target directory.
* `/root/latest_audit` → Link name.

### Purpose

Provides a convenient shortcut to the latest backup.

---

## Step 7: Verify the Symbolic Link

### Command

```bash
sudo ls -la /root/latest_audit
```

### Explanation

* `ls` → List files and directories.
* `-l` → Long listing format.
* `-a` → Show hidden files as well.

### Expected Output

```text
/root/latest_audit -> /tmp/audit_backup
```

### Purpose

Confirms that the symbolic link points to the correct backup location.

---

## Step 8: Count Backed-Up Files

### Command

```bash
find /tmp/audit_backup -name '*.conf' | wc -l
```

### Explanation

* `find` → Locate backed-up `.conf` files.
* `|` → Pipe output to another command.
* `wc` → Word count utility.
* `-l` → Count lines.

### Purpose

Calculates the total number of configuration files backed up.

### Result

```text
3
```

This indicates that 3 configuration files were successfully backed up.

---

## Verification Summary

### Backup Structure

```bash
tree /tmp/audit_backup
```

### Symlink Verification

```bash
sudo ls -la /root/latest_audit
```

### File Count Verification

```bash
find /tmp/audit_backup -name '*.conf' | wc -l
```

---

## Conclusion

This task demonstrates:

* File searching using `find`
* Filtering files by modification time
* Preserving directory structures during copy operations
* Creating symbolic links
* Verifying backups
* Counting files using Linux pipelines

The backup was successfully created, the directory structure was preserved, the symbolic link was configured correctly, and all matching configuration files were verified.

# Key Insights I learned 


While doing this task, I first searched for recently modified `.conf` files inside `/etc` using the `find` command. I expected the backup part to be simple, but I was surprised to see how important preserving the directory structure is. If all configuration files were copied into a single folder, it would be difficult to know where each file originally came from. Using `cp --parents` solved this problem by keeping the original path inside the backup directory.

One issue I faced was while verifying the symbolic link. When I ran `ls -la /root/latest_audit`, I got a "Permission denied" error. At first, I thought the link was not created properly, but then I realized that `/root` is a protected directory and requires `sudo` access. After running the command with `sudo`, I was able to verify that the link was working correctly.

What I found interesting is that this is very similar to what system administrators and cloud engineers do in real environments. Before updating a server or making configuration changes, they often create backups of important configuration files, verify the backup, and keep an easy way to access it. The same concepts are used in cloud platforms like AWS when managing EC2 instances, troubleshooting systems, or automating backup processes through scripts.

Overall, this task helped me understand that Linux administration is not just about running commands individually; it is about combining commands to perform a complete workflow that includes searching, backing up, verifying, and validating results.













