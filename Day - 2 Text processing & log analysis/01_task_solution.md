
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



# Key Learning

At first I thought finding failed SSH logins would be as simple as grepping for "Failed password" lines. But once I started analyzing `/var/log/secure`, I realized the real challenge was extracting useful information from those logs. Using `grep`, `awk`, `sort`, and `uniq`, I was able to pull out the source IP addresses, count how many times each IP appeared, rank them by frequency, and also list all usernames that attackers were trying to access. The final report was saved into `/tmp/ssh_threat_report.txt` in a clean, readable format.

One thing I noticed is that log files are not structured the same way as normal data files. The position of the IP address and username in the log line mattered a lot. My first extraction attempts returned incorrect values because I was targeting the wrong fields with `awk`. After checking the actual log format and adjusting the field numbers, the counts and usernames started appearing correctly. Sorting before running `uniq -c` was also necessary; otherwise duplicate IPs were not counted properly.

This task showed me how security teams quickly identify suspicious login activity without using advanced tools or scripts. In cloud environments such as AWS EC2, Azure VMs, or production Linux servers in MNCs, administrators often analyze authentication logs to detect brute-force attacks, identify the most aggressive source IPs, and discover which accounts attackers are targeting. The same grep–awk–sort–uniq workflow is commonly used during security investigations, incident response, and routine server monitoring.




















