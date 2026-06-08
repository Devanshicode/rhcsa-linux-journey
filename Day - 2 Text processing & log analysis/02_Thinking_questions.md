
# Thinking Questions and Practical Insights

Q1. tail -f vs repeatedly running grep

Ans:

When I first used tail -f, I thought it was just a shortcut for running grep over and over again. Then I understood that tail -f actually keeps the file open and watches it continuously. If new lines are added, they appear instantly without reopening the file.

Running grep repeatedly is different because every execution opens the file, reads it, prints results, and exits. tail -f maintains an active file descriptor, which is a reference the operating system uses to keep a file open.

This taught me an important Linux concept: processes do not access files directly. They use file descriptors managed by the kernel. Tools like tail -f are efficient because they keep the descriptor open and wait for changes instead of constantly reopening the file. This is why system administrators use tail -f /var/log/secure during incident response to watch attacks in real time.

Q2. Why must sort come before uniq?

Ans:

When I first saw the pipeline sort | uniq -c | sort -rn, I assumed uniq could count duplicates anywhere in a file. Then I learned that uniq only works on adjacent matching lines.

For example:

apple
banana
apple

uniq -c would treat the two apple entries as separate because they are not next to each other. The sort command groups identical entries together first:

apple
apple
banana

Now uniq -c can correctly count them.

This taught me a valuable lesson about Linux pipelines: many commands are simple and do one job well. sort prepares the data, uniq counts it, and sort -rn ranks it. Together they become a powerful log-analysis workflow used by administrators to identify top IP addresses, frequent errors, or suspicious activity.

Q3. Using awk to total disk usage from du output

Ans:

When I learned that awk can perform arithmetic, I realized it is much more than a text-processing tool. Commands like du output size information in the first column, and awk can add those values together.

For example:

du -k | awk '{sum+=$1} END {print sum}'

Here, $1 represents the size column. awk adds each value to the variable sum. When the input ends, the END block prints the final total.

This showed me that Linux tools are designed to work together. du collects storage information and awk performs the calculations. Instead of exporting data into another program, administrators can analyze storage usage directly from the command line. This becomes especially useful on servers where quick troubleshooting matters.

Q4. SSH attack detected 200 times — what next?

Ans:

When my SSH report showed an IP attacking the server 200 times, I understood that finding the attacker is only the first step. The next responsibility is protecting the system.

My first action would be to block the attacking IP using the firewall. For example, with firewalld:

firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="ATTACKER_IP" drop'
firewall-cmd --reload

My second action would be to review authentication logs and verify whether any login attempts succeeded. A failed-password attack is concerning, but a successful login would indicate a possible compromise.

My third action would be to harden SSH security by disabling password authentication, using SSH keys, changing default settings where appropriate, and enabling tools such as Fail2Ban to automatically block repeated offenders.

This taught me that cybersecurity is not only about detection. Detection identifies the threat, but response and prevention are what actually protect the server. In real cloud environments such as AWS EC2, administrators often combine firewall rules, security groups, monitoring, and intrusion-prevention tools to stop attacks before they become incidents.
























