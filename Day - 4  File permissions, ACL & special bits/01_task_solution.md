
# Task 4 - Full Permission Lab

## Step 1: Create Group

### Command

```bash
sudo groupadd devteam
```

### Explanation

Creates a new group named devteam.

### Purpose

Used as the shared project group.

---

## Step 2: Create Users

### Command

```bash
sudo useradd alice
sudo useradd bob
sudo useradd carol
```

### Explanation

Creates three user accounts.

### Purpose

Users for permission testing.

---

## Step 3: Add Alice to devteam

### Command

```bash
sudo usermod -aG devteam alice
```

### Explanation

Adds alice to the devteam group.

### Purpose

Allows alice to work inside the shared project.

---

## Step 4: Create Project Directory

### Command

```bash
sudo mkdir -p /srv/project
```

### Explanation

Creates the project directory.

### Purpose

Shared workspace for users.

---

## Step 5: Assign Group Ownership

### Command

```bash
sudo chown root:devteam /srv/project
```

### Explanation

Sets root as owner and devteam as group owner.

### Purpose

Allows group-based access control.

---

## Step 6: Enable SGID

### Command

```bash
sudo chmod 2775 /srv/project
```

### Explanation

Sets SGID on the directory.

### Purpose

All new files inherit group devteam automatically.

---

## Step 7: Grant Alice Full Access

### Command

```bash
sudo setfacl -m u:alice:rwx /srv/project
```

### Explanation

Provides read, write, and execute permissions.

### Purpose

Alice has full control.

---

## Step 8: Grant Bob Read-Only Access

### Command

```bash
sudo setfacl -m u:bob:r-- /srv/project
```

### Explanation

Provides read permission only.

### Purpose

Bob can view but not modify files.

---

## Step 9: Deny Carol Access

### Command

```bash
sudo setfacl -m u:carol:--- /srv/project
```

### Explanation

Removes all permissions.

### Purpose

Carol cannot access the directory.

---

## Step 10: Verify ACLs

### Command

```bash
getfacl /srv/project
```

### Explanation

Displays ACL entries.

### Purpose

Verifies user permissions.

---

## Step 11: Create Configuration File

### Command

```bash
sudo touch /srv/project/config.conf
```

### Explanation

Creates an empty configuration file.

### Purpose

Used for immutable file testing.

---

## Step 12: Make File Immutable

### Command

```bash
sudo chattr +i /srv/project/config.conf
```

### Explanation

Applies immutable attribute.

### Purpose

Prevents modification, deletion, or renaming.

---

## Step 13: Verify Immutable Attribute

### Command

```bash
lsattr /srv/project/config.conf
```

### Explanation

Shows file attributes.

### Purpose

Confirms immutable status.

---

## Step 14: Create Shared Directory

### Command

```bash
sudo mkdir -p /tmp/shared
```

### Explanation

Creates a shared temporary directory.

### Purpose

Used for sticky bit testing.

---

## Step 15: Set Sticky Bit

### Command

```bash
sudo chmod 1777 /tmp/shared
```

### Explanation

Applies sticky bit with full permissions.

### Purpose

Users can delete only their own files.

---

## Step 16: Verify Sticky Bit

### Command

```bash
ls -ld /tmp/shared
```

### Explanation

Displays directory permissions.

### Purpose

Confirms sticky bit is enabled.

---

## Step 17: Find SUID Binaries

### Command

```bash
find / -perm -4000 -type f 2>/dev/null
```

### Explanation

Searches the system for SUID-enabled files.

### Purpose

Identifies privileged executables.

---

## Step 18: Save Audit Report

### Command

```bash
find / -perm -4000 -type f 2>/dev/null > /tmp/suid_audit.txt
```

### Explanation

Stores SUID file list in an audit report.

### Purpose

Creates a security audit record.

---

## Step 19: Count SUID Files

### Command

```bash
wc -l /tmp/suid_audit.txt
```

### Explanation

Counts lines in the report.

### Purpose

Shows total SUID binaries found.



# Key Learning 


At first I thought Linux permissions were only about chmod, but while working on this lab I learned that real access control is much more detailed. Setting the SGID bit on `/srv/project` ensured that every new file automatically inherited the `devteam` group, which is much easier than manually fixing group ownership every time someone creates a file. ACLs were also interesting because they allowed different access levels for different users on the same directory — `alice` could fully manage files, `bob` could only read them, and `carol` was completely blocked.

The part that needed extra attention was file protection. Even if a user has permissions on a file, making `config.conf` immutable with `chattr +i` prevents accidental modification or deletion. I also noticed that the sticky bit on `/tmp/shared` changes how shared directories behave, allowing users to create files while preventing them from deleting files owned by others. Without these special permissions, shared environments can quickly become messy or insecure.

The SUID audit was another eye-opener. Running a search for all SUID binaries and saving them to `/tmp/suid_audit.txt` showed how many programs run with elevated privileges. This helped me understand why security teams regularly audit SUID files—an unnecessary or misconfigured SUID binary can become a privilege-escalation risk. These are the same concepts used in enterprise Linux servers, cloud VMs, and MNC production environments where teams need controlled collaboration, secure configuration files, and regular security compliance checks.
























