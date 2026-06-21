
# Task 5 - Phase 1 Capstone Security Audit

## Objective

Perform a complete server security audit and save the results in:

```bash
/tmp/server_audit_report.txt
```

---

## Step 1: Create Report File

### Command

```bash
echo "===== SERVER SECURITY AUDIT REPORT =====" > /tmp/server_audit_report.txt
```

### Explanation

Creates a new audit report file and writes the report title.

### Purpose

Initialize the audit report.

---

## Step 2: List Users with UID > 999

### Command

```bash
echo -e "\n===== USERS WITH UID > 999 =====" >> /tmp/server_audit_report.txt
awk -F: '$3>999 {print $1 " UID=" $3}' /etc/passwd >> /tmp/server_audit_report.txt
```

### Explanation

- `awk` processes `/etc/passwd`
- `-F:` uses `:` as field separator
- `$3` represents UID
- Prints usernames whose UID is greater than 999

### Purpose

Identify normal user accounts.

---

## Step 3: Find SUID Files

### Command

```bash
echo -e "\n===== SUID FILES =====" >> /tmp/server_audit_report.txt
find / -type f -perm -4000 2>/dev/null >> /tmp/server_audit_report.txt
```

### Explanation

- Searches entire filesystem
- `-type f` searches regular files
- `-perm -4000` finds SUID files
- `2>/dev/null` hides permission errors

### Purpose

Identify files that run with elevated privileges.

---

## Step 4: Find World-Writable Directories

### Command

```bash
echo -e "\n===== WORLD WRITABLE DIRECTORIES =====" >> /tmp/server_audit_report.txt
find / -type d -perm -0002 2>/dev/null >> /tmp/server_audit_report.txt
```

### Explanation

- `-type d` searches directories
- `-perm -0002` finds directories writable by everyone

### Purpose

Detect potentially insecure directories.

---

## Step 5: Check Last Login Information

### Command

```bash
echo -e "\n===== LAST LOGIN INFORMATION =====" >> /tmp/server_audit_report.txt
lastlog >> /tmp/server_audit_report.txt
```

### Explanation

Displays the most recent login for each user.

### Purpose

Identify inactive or suspicious accounts.

---

## Step 6: Find .conf Files Modified in Last 7 Days

### Command

```bash
echo -e "\n===== .CONF FILES MODIFIED IN LAST 7 DAYS =====" >> /tmp/server_audit_report.txt
find /etc -name "*.conf" -mtime -7 2>/dev/null >> /tmp/server_audit_report.txt
```

### Explanation

- Searches for `.conf` files
- `-mtime -7` means modified within last 7 days

### Purpose

Track recent configuration changes.

---

## Step 7: View Audit Report

### Command

```bash
cat /tmp/server_audit_report.txt
```

### Explanation

Displays the complete audit report.

### Purpose

Verify audit results.

---

## Final Report Location

```bash
/tmp/server_audit_report.txt
```


# Key Learning 


When I worked on the server audit task, I learned that collecting security information from different parts of the system is much easier when everything is redirected into a single report file. Using commands like `/etc/passwd` filtering for UID greater than 999, checking SUID files, world-writable directories, last login records, and recently modified `.conf` files gave me a complete picture of the server's security state in one place instead of checking each item separately on the screen.

One thing that stood out was how much information a Linux system already stores. The `lastlog` command immediately showed login history for every user, while `find` revealed dozens of SUID files and writable directories that I normally never notice during daily administration. I also realized that using clear section headers inside the report makes the output much easier to read and troubleshoot later.

While generating the report, permission-related messages could easily mix with the actual audit results and make the report difficult to understand. Redirecting unwanted error messages with `2>/dev/null` helped keep the report clean and focused only on useful security findings. Proper output redirection was also important because using `>` and `>>` incorrectly could overwrite previous sections of the report.

This is very similar to real cloud and MNC environments where system administrators and DevOps engineers perform regular security audits on Linux servers, EC2 instances, and virtual machines. Instead of manually checking hundreds of systems, automated audit scripts generate structured reports that help teams identify risky permissions, unexpected user accounts, suspicious SUID files, and configuration changes before they become security incidents.

























