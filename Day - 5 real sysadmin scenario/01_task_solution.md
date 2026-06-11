
# Task - 5 Phase 1 capstone


<img width="1280" height="800" alt="task - 5 1" src="https://github.com/user-attachments/assets/5cc9a612-92fd-44da-9401-d1d7e7ecc99e" />





<img width="1280" height="800" alt="task - 5 2" src="https://github.com/user-attachments/assets/6853cf88-174f-4f58-a083-d8e301b4ebe1" />






## Objective
Phase 1 capstone: You are given a new server. Perform a full security audit: (1) List all users with UID>999. (2) Find all files with SUID. (3) Find world-writable directories. (4) Check all users' last login. (5) Find .conf files modified in last 7 days. Output everything to /tmp/server_audit_report.txt with section headers.



# Step 1: Create Report Header

## Command

```bash id="9tmnmi"
echo "===== SERVER SECURITY AUDIT REPORT =====" > /tmp/server_audit_report.txt
```

## Purpose

Creates the report file and adds a title.

## Command Breakdown

* `echo` → prints text.
* `"===== SERVER SECURITY AUDIT REPORT ====="` → title text.
* `>` → creates a new file or overwrites an existing one.
* `/tmp/server_audit_report.txt` → destination file.

---

# Step 2: List All Users with UID Greater Than 999

## Command

```bash id="2tl8qz"
echo -e "\n=== USERS WITH UID > 999 ===" >> /tmp/server_audit_report.txt

awk -F: '$3>999 {print $1,$3}' /etc/passwd >> /tmp/server_audit_report.txt
```

## Purpose

Finds all regular users on the system.

System accounts usually have UIDs below 1000.

Human users generally have UIDs above 999.

## Command Breakdown

### First Command

```bash id="nhrxvd"
echo -e "\n=== USERS WITH UID > 999 ==="
```

* `-e` enables escape characters.
* `\n` inserts a blank line.
* Creates a section header.

### Second Command

```bash id="6y60hb"
awk -F: '$3>999 {print $1,$3}' /etc/passwd
```

* `awk` → text processing tool.
* `-F:` → use `:` as separator.
* `$3` → third field (UID).
* `$3>999` → select users with UID above 999.
* `$1` → username.
* `$3` → UID.

Example:

```text id="y6tq7l"
alice 1001
bob 1002
```

---

# Step 3: Find All SUID Files

## Command

```bash id="73ajzi"
echo -e "\n=== SUID FILES ===" >> /tmp/server_audit_report.txt

find / -perm -4000 2>/dev/null >> /tmp/server_audit_report.txt
```

## Purpose

Finds files running with owner privileges.

SUID files are important because they can be abused by attackers if misconfigured.

## Command Breakdown

```bash id="n3a29j"
find / -perm -4000
```

* `find` → search filesystem.
* `/` → start from root directory.
* `-perm -4000` → locate SUID files.

Examples:

```text id="xibltu"
/usr/bin/passwd
/usr/bin/su
```

### Error Handling

```bash id="b0svyr"
2>/dev/null
```

* `2` = standard error.
* `>` redirects errors.
* `/dev/null` discards them.

This hides permission denied messages.

---

# Step 4: Find World-Writable Directories

## Command

```bash id="th1q7u"
echo -e "\n=== WORLD WRITABLE DIRECTORIES ===" >> /tmp/server_audit_report.txt

find / -type d -perm -0002 2>/dev/null >> /tmp/server_audit_report.txt
```

## Purpose

Find directories that everyone can write to.

These can be security risks if not properly managed.

## Command Breakdown

```bash id="0xep8j"
find / -type d -perm -0002
```

* `-type d` → search only directories.
* `-perm -0002` → world writable permission.

Example:

```text id="jvdzbw"
/tmp
/var/tmp
```

---

# Step 5: Check Last Login of All Users

## Command

```bash id="0gplpv"
echo -e "\n=== LAST LOGIN INFORMATION ===" >> /tmp/server_audit_report.txt

lastlog >> /tmp/server_audit_report.txt
```

## Purpose

Shows when each user last logged into the server.

Useful during security investigations.

## Command Breakdown

```bash id="a0mtvl"
lastlog
```

Example:

```text id="2rj0tx"
Username         Port     From             Latest
alice            pts/0    192.168.1.5      Mon Jun 9 09:00
```

---

# Step 6: Find .conf Files Modified in Last 7 Days

## Command

```bash id="kv6lq0"
echo -e "\n=== .CONF FILES MODIFIED IN LAST 7 DAYS ===" >> /tmp/server_audit_report.txt

find /etc -name "*.conf" -mtime -7 2>/dev/null >> /tmp/server_audit_report.txt
```

## Purpose

Configuration files control system services.

Recent modifications may indicate maintenance or suspicious activity.

## Command Breakdown

```bash id="81t8hm"
find /etc -name "*.conf" -mtime -7
```

* `/etc` → configuration directory.
* `-name "*.conf"` → search configuration files.
* `-mtime -7` → modified within last 7 days.

Example:

```text id="bghz84"
/etc/httpd/conf/httpd.conf
/etc/ssh/sshd_config.conf
```

---

# Step 7: View Report

## Command

```bash id="v9w24e"
cat /tmp/server_audit_report.txt
```

## Purpose

Displays the final report.

## Command Breakdown

* `cat` = display file contents.

---




# What I Learned

This capstone project taught me how Linux administrators perform an initial security assessment on a server. Instead of checking everything manually, I learned how to combine tools such as `awk`, `find`, `lastlog`, and output redirection to generate a structured audit report. These same concepts are used in RHCSA, cloud administration, and real-world production environments to identify suspicious users, risky permissions, recent configuration changes, and potential security issues.







## Key Insights I Learned


I performed a complete security audit on a Linux server using built-in commands like awk, find, and last. Instead of checking files manually, I automated everything into a single report file.


The biggest surprise was how many SUID files exist on a normal Linux installation. I initially thought only sudo used elevated privileges, but Linux contains several trusted programs that temporarily run with higher permissions.

I was also surprised by how useful 2>/dev/null is. Without it, the output becomes cluttered with hundreds of permission errors and it becomes difficult to focus on the real findings.


At first I ran:

find / -perm -4000 and thought something was wrong because my screen filled with permission-denied messages.

After learning about: 2>/dev/null the output became clean and much easier to analyze.
I also initially forgot the difference between:
(> , and , >> ) Using > repeatedly overwrote my report. I had to switch to >> so each audit section was appended correctly.

This exercise felt very similar to what a Linux administrator or cloud engineer would do when receiving a new server. Before deploying applications, teams often audit users, permissions, SUID files, login history, and configuration changes.

In AWS EC2, Azure Virtual Machines, and enterprise Linux environments, these checks are commonly included in security hardening and compliance processes. The same concepts are used by DevOps engineers, system administrators, security analysts, and cloud operations teams to identify risks before they become incidents.









