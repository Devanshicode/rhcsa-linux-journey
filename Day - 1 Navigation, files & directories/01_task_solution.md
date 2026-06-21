
# Task 1 - Backup Recently Modified Configuration Files

## Objective

Find all `.conf` files modified in the last 3 days under `/etc`, copy them to `/tmp/audit_backup` while preserving directory structure, create a symbolic link, and count the backed-up files.

---

## Step 1: Create Backup Directory

### Command

```bash
mkdir -p /tmp/audit_backup
```

### Explanation

* `mkdir` → Creates directories.
* `-p` → Creates parent directories if needed and avoids errors if directory already exists.

### Purpose

Creates the destination directory where configuration files will be backed up.

---

## Step 2: Find Recently Modified Configuration Files

### Command

```bash
find /etc -type f -name "*.conf" -mtime -3
```

### Explanation

* `find` → Searches files/directories.
* `/etc` → Search location.
* `-type f` → Only regular files.
* `-name "*.conf"` → Files ending with `.conf`.
* `-mtime -3` → Modified within the last 3 days.

### Purpose

Identifies all recently modified configuration files.

---

## Step 3: Copy Files While Preserving Directory Structure

### Command

```bash
find /etc -type f -name "*.conf" -mtime -3 -exec cp --parents {} /tmp/audit_backup \;
```

### Explanation

* `-exec` → Runs a command for each file found.
* `cp` → Copy command.
* `--parents` → Preserves original directory hierarchy.
* `{}` → Placeholder for the current file.
* `\;` → Ends the `-exec` command.

### Purpose

Copies all matching files into the backup directory while retaining their original paths.

---

## Step 4: Verify Backup Contents

### Command

```bash
find /tmp/audit_backup
```

### Purpose

Displays the copied files and directory structure.

---

## Step 5: Create Symbolic Link

### Command

```bash
ln -s /tmp/audit_backup /root/latest_audit
```

### Explanation

* `ln` → Create links.
* `-s` → Create a symbolic (soft) link.

### Purpose

Creates a shortcut named `latest_audit` pointing to the backup directory.

---

## Step 6: Verify Symbolic Link

### Command

```bash
ls -l /root/latest_audit
```

### Purpose

Confirms that the symbolic link points to `/tmp/audit_backup`.

---

## Step 7: Count Backed-Up Files

### Command

```bash
find /tmp/audit_backup -type f | wc -l
```

### Explanation

* `find` → Lists files.
* `|` → Sends output to another command.
* `wc -l` → Counts lines.

### Purpose

Displays the total number of configuration files backed up.

---

## Final Verification

```bash
find /tmp/audit_backup -type f | wc -l
ls -l /root/latest_audit
```

These commands verify the backup count and symbolic link configuration.
