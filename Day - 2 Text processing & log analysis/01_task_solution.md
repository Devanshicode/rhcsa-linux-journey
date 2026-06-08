
# Task 2: SSH Failed Login Analysis


<img width="1280" height="800" alt="day 2 task" src="https://github.com/user-attachments/assets/900832a4-5fde-4c6d-98d1-a17fe1beaa0a" />




## Objective

The objective of this task is to analyze the Linux security log file and identify failed SSH login attempts. By using Linux command-line tools such as grep, awk, sort, uniq, and cat, I extracted failed login records, identified suspicious IP addresses, counted their occurrences, extracted targeted usernames, and generated a ranked security report. This task helped me understand basic log analysis and cybersecurity investigation techniques using only Linux commands.

---

## Step 1: View Failed SSH Login Attempts

### Command

```bash
sudo grep 'Failed' /var/log/secure
```

### Explanation

* `sudo` runs the command with administrative privileges.
* `grep` searches for specific text patterns.
* `'Failed'` is the keyword being searched.
* `/var/log/secure` is the Linux security log file.

### Purpose

I used this command to display all failed SSH login attempts recorded in the security log.

---

## Step 2: Save Failed Login Entries to a File

### Command

```bash
sudo grep 'Failed' /var/log/secure > /tmp/failed.txt
```

### Explanation

* `>` redirects the output into a file.
* `/tmp/failed.txt` stores all failed login entries.

### Purpose

I used this command to save the failed login records into a separate file for further analysis.

---

## Step 3: Extract Source IP Addresses

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $11}'
```

### Explanation

* `|` passes the output of one command to another.
* `awk` processes text fields.
* `$11` extracts the 11th field, which contains the source IP address.

### Purpose

I used this command to identify the IP addresses from which failed SSH login attempts originated.

---

## Step 4: Count Occurrences of Each IP Address

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $11}' | sort | uniq -c
```

### Explanation

* `sort` arranges identical IP addresses together.
* `uniq -c` counts repeated occurrences.

### Purpose

I used this command to determine how many failed login attempts came from each IP address.

---

## Step 5: Rank IP Addresses by Frequency

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $11}' | sort | uniq -c | sort -rn
```

### Explanation

* `sort -n` sorts numerically.
* `sort -r` sorts in reverse order.
* The most frequent IP addresses appear at the top.

### Purpose

I used this command to identify the most suspicious IP addresses based on the number of failed login attempts.

---

## Step 6: Save Ranked IP Report

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $11}' | sort | uniq -c | sort -rn > /tmp/ssh_threat_report.txt
```

### Explanation

* The complete ranked IP report is redirected into a file.

### Purpose

I used this command to create a security report containing ranked IP addresses and their failed login counts.

---

## Step 7: Extract Targeted Usernames

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $9}'
```

### Explanation

* `$9` extracts the username field from each failed login record.

### Purpose

I used this command to determine which user accounts were targeted during failed SSH login attempts.

---

## Step 8: Count Username Occurrences

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $9}' | sort | uniq -c | sort -rn
```

### Explanation

* `sort` groups identical usernames together.
* `uniq -c` counts occurrences.
* `sort -rn` ranks usernames by frequency.

### Purpose

I used this command to identify the most frequently targeted user accounts.

---

## Step 9: Append Username Report

### Command

```bash
grep 'Failed' /var/log/secure | awk '{print $9}' | sort | uniq -c | sort -rn >> /tmp/ssh_threat_report.txt
```

### Explanation

* `>>` appends data to an existing file instead of overwriting it.

### Purpose

I used this command to add the username analysis results to the existing threat report.

---

## Step 10: Display the Final Report

### Command

```bash
cat /tmp/ssh_threat_report.txt
```

### Explanation

* `cat` displays the contents of a file.

### Purpose

I used this command to review the complete SSH threat report containing both IP address statistics and targeted usernames.

---

## Step 11: Count Total Failed Login Attempts

### Command

```bash
grep -c 'Failed' /var/log/secure
```

### Explanation

* `-c` counts the number of matching lines.
* `'Failed'` is the search pattern.

### Purpose

I used this command to calculate the total number of failed SSH login attempts recorded in the security log.

---

## Conclusion

In this task, I analyzed SSH authentication logs stored in the Linux security log file. Using grep, awk, sort, uniq, and cat, I extracted failed login attempts, identified attacking IP addresses, counted their occurrences, ranked them by frequency, extracted targeted usernames, and generated a structured threat report. This exercise improved my understanding of Linux log analysis, command-line text processing, and basic cybersecurity investigation techniques.






# Key Insights I Learned 


While performing this task, I initially viewed the failed login entries directly from the security log and found it difficult to identify meaningful patterns because the output contained many individual records. I realized that simply reading log entries is not enough when analyzing security events. By combining grep, awk, sort, and uniq, I was able to transform raw log data into useful information.

One mistake I made was forgetting that repeated values must be sorted before using uniq -c. When I ran uniq -c without sorting first, some duplicate entries were not counted correctly because uniq only counts consecutive matching lines. After adding the sort command before uniq -c, the counts became accurate.

I also learned how powerful the pipe operator (|) is in Linux. Instead of creating multiple temporary files, I could pass the output of one command directly into another command, making the analysis process much more efficient.

What I found most interesting is that this task closely resembles real-world security monitoring. System administrators, SOC analysts, and cloud engineers regularly analyze authentication logs to detect brute-force attacks, investigate suspicious activity, and identify compromised accounts. The same concepts are used in enterprise Linux servers, cloud environments, and cybersecurity operations.

Overall, this task helped me understand that Linux administration is not only about running individual commands but also about combining multiple commands into a workflow that can collect, filter, analyze, summarize, and report security-related information.

















