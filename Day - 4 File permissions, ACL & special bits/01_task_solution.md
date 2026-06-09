
# Task - 4 Linux Permissions & Security Lab




<img width="1280" height="800" alt="task 4" src="https://github.com/user-attachments/assets/c76fa995-2807-4397-aedb-48493437a915" />





## Objective

Full permission lab: Create /srv/project with SGID so all new files inherit group 'devteam'. alice has full access, bob has read-only via ACL, carol has NO access. Make config.conf immutable. Set sticky bit on /tmp/shared. Find all SUID binaries on the system and save list to /tmp/suid_audit.txt.

---

# Step 1: Create Required Users and Group

## Command

```bash
sudo groupadd devteam

sudo useradd alice
sudo useradd bob
sudo useradd carol
```

## Command Breakdown

### groupadd

* `groupadd` = Create a new Linux group.
* `devteam` = Name of the group.

### useradd

* `useradd` = Create a user account.
* `alice`, `bob`, `carol` = Usernames.

## Purpose

A development team typically works within a common group. Creating users and a shared group simulates a real company environment.

---

# Step 2: Add Users to the Group

## Command

```bash
sudo usermod -aG devteam alice
sudo usermod -aG devteam bob
```

## Command Breakdown

### usermod

* `usermod` = Modify user account settings.
* `-a` = Append.
* `-G` = Secondary group assignment.
* `devteam` = Group to add.

## Purpose

Both Alice and Bob become members of the development team.

Carol is intentionally excluded because she should not access the project.

---

# Step 3: Create the Project Directory

## Command

```bash
sudo mkdir -p /srv/project
```

## Command Breakdown

### mkdir

* `mkdir` = Make directory.
* `-p` = Create parent directories if missing.
* `/srv/project` = Project location.

## Purpose

The `/srv` directory is commonly used for service and project data on Linux systems.

---

# Step 4: Assign Ownership

## Command

```bash
sudo chown alice:devteam /srv/project
```

## Command Breakdown

### chown

* `chown` = Change owner.
* `alice` = User owner.
* `devteam` = Group owner.

## Purpose

Alice becomes the owner while the project belongs to the development team group.

---

# Step 5: Enable SGID

## Command

```bash
sudo chmod 2775 /srv/project
```

## Command Breakdown

### chmod

* `chmod` = Change permissions.
* `2` = SGID bit.
* `775` = Standard permissions.

Permission Meaning:

```text
Owner : rwx
Group : rwx
Others: r-x
```

### SGID

The SGID bit forces newly created files to inherit the directory's group ownership.

Without SGID:

```text
alice creates file → group = alice
```

With SGID:

```text
alice creates file → group = devteam
bob creates file → group = devteam
```

## Purpose

Ensures all project files remain under the development team's ownership.

---

# Step 6: Verify SGID

## Command

```bash
ls -ld /srv/project
```

## Expected Output

```text
drwxrwsr-x
```

Notice:

```text
s
```

appears in the group permission section.

## Purpose

Confirms SGID is active.

---

# Step 7: Configure ACL for Bob

## Command

```bash
sudo setfacl -m u:bob:r-- /srv/project
```

## Command Breakdown

### setfacl

* `setfacl` = Set Access Control List.
* `-m` = Modify ACL.
* `u:bob:r--`

  * `u` = User.
  * `bob` = Username.
  * `r--` = Read-only permission.

## Purpose

Bob can read project content but cannot modify it.

---

# Step 8: Deny Carol Access

## Command

```bash
sudo setfacl -m u:carol:--- /srv/project
```

## Command Breakdown

```text
u = user
carol = target user
--- = no permissions
```

## Purpose

Carol cannot access project files.

---

# Step 9: Verify ACLs

## Command

```bash
getfacl /srv/project
```

## Expected Output

```text
user::rwx
user:bob:r--
user:carol:---
group::rwx
```

## Purpose

Displays ACL configuration.

---

# Step 10: Create Configuration File

## Command

```bash
sudo touch /srv/project/config.conf
```

## Command Breakdown

### touch

Creates an empty file.

## Purpose

Represents an application configuration file.

---

# Step 11: Make File Immutable

## Command

```bash
sudo chattr +i /srv/project/config.conf
```

## Command Breakdown

### chattr

Changes extended file attributes.

### +i

Adds immutable flag.

## Purpose

Prevents:

* Modification
* Renaming
* Deletion

Even root must remove the attribute first.

---

# Step 12: Verify Immutable Attribute

## Command

```bash
lsattr /srv/project/config.conf
```

## Expected Output

```text
----i---------
```

## Purpose

Confirms immutable protection.

---

# Step 13: Create Shared Directory

## Command

```bash
sudo mkdir /tmp/shared
```

## Purpose

Creates a public shared folder.

---

# Step 14: Set Sticky Bit

## Command

```bash
sudo chmod 1777 /tmp/shared
```

## Command Breakdown

### 1

Sticky Bit

### 777

Everyone gets full access.

## Purpose

Users can create files but cannot delete files owned by others.

This is the same protection used by `/tmp`.

---

# Step 15: Verify Sticky Bit

## Command

```bash
ls -ld /tmp/shared
```

## Expected Output

```text
drwxrwxrwt
```

Notice:

```text
t
```

at the end.

## Purpose

Confirms Sticky Bit is enabled.

---

# Step 16: Find All SUID Binaries

## Command

```bash
find / -perm -4000 -type f 2>/dev/null > /tmp/suid_audit.txt
```

## Command Breakdown

### find

Search filesystem.

### /

Search entire system.

### -perm -4000

Locate files with SUID permission.

### -type f

Only regular files.

### 2>/dev/null

Hide permission-denied errors.

### >

Redirect output to file.

## Purpose

Creates a security audit of programs that run with elevated privileges.

---

# Step 17: Review Audit Results

## Command

```bash
head /tmp/suid_audit.txt
```

## Example Output

```text
/usr/bin/passwd
/usr/bin/su
/usr/bin/mount
/usr/bin/chsh
```

## Purpose

Review the first few discovered SUID binaries.

---

# Final Verification Checklist

```bash
ls -ld /srv/project
getfacl /srv/project
lsattr /srv/project/config.conf
ls -ld /tmp/shared
head /tmp/suid_audit.txt
```

## What I Learned

This lab taught me how Linux uses permissions, ACLs, SGID, Sticky Bit, immutable files, and SUID binaries to control access and improve security. These features are commonly used in enterprise Linux servers, DevOps environments, RHCSA administration tasks, and cloud platforms such as AWS EC2.






















