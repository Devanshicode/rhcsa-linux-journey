
# Task 2 - Analyze SSH Login Threats

## Objective

Analyze `/var/log/secure` to identify:

* Failed SSH login attempts
* Source IP addresses
* Frequency of attacks per IP
* Usernames targeted by attackers

Generate a ranked report and save it to:

```bash
/tmp/ssh_threat_report.txt
```

---

## Step 1: Verify Log File

### Command

```bash
ls -l /var/log/secure
```

### Purpose

Confirm the SSH authentication log exists.

---

## Step 2: View Failed SSH Login Attempts

### Command

```bash
grep "Failed password" /var/log/secure
```

### Purpose

Display all failed SSH login entries.

---

## Step 3: Extract Attacker IP Addresses

### Command

```bash
grep "Failed password" /var/log/secure | awk '{print $(NF-3)}'
```

### Purpose

Extract source IP addresses from failed login attempts.

---

## Step 4: Count Failed Attempts Per IP

### Command

```bash
grep "Failed password" /var/log/secure | awk '{print $(NF-3)}' | sort | uniq -c
```

### Purpose

Count occurrences of each attacking IP.

---

## Step 5: Rank IP Addresses by Frequency

### Command

```bash
grep "Failed password" /var/log/secure | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr
```

### Purpose

Display attacker IPs ranked from highest to lowest frequency.

---

## Step 6: Extract Targeted Usernames

### Command

```bash
grep "Failed password" /var/log/secure | awk '{for(i=1;i<=NF;i++) if($i=="for") print $(i+1)}' | sort | uniq
```

### Purpose

Identify usernames targeted during SSH attacks.

---

## Step 7: Generate Security Report

### Command

```bash
{
echo "===== SSH THREAT REPORT ====="
echo
echo "Top Failed SSH Login IPs:"
grep "Failed password" /var/log/secure | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr
echo
echo "Targeted Usernames:"
grep "Failed password" /var/log/secure | awk '{for(i=1;i<=NF;i++) if($i=="for") print $(i+1)}' | sort | uniq
} > /tmp/ssh_threat_report.txt
```

### Purpose

Generate a complete ranked SSH threat report.

---

## Step 8: View Report

### Command

```bash
cat /tmp/ssh_threat_report.txt
```

### Purpose

Display the final SSH threat report.
