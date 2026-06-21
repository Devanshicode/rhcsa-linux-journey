
# Thinking Questions – Reflection Answers

## 1. SELinux denied nginx from serving your file even though chmod and chown were correct. How does this happen? What layer is SELinux operating at?

When I first learned about Linux permissions, I thought that if `chmod` and `chown` were correct, any application should be able to access the file. Then I understood that Linux has another security layer called SELinux. Traditional permissions only check the user, group, and file permissions, but SELinux checks security labels and policies. Even if nginx has permission from the file system perspective, SELinux can still block access if the file is labeled with the wrong security context. In this case nginx was denied because SELinux policy did not allow it to read that specific file label. SELinux operates as a Mandatory Access Control (MAC) layer on top of normal Linux permissions, which means both permission systems must allow access before it succeeds. This extra layer is important because even if an attacker compromises nginx, SELinux can limit what the process is allowed to do.

---

## 2. PermitRootLogin no forces attackers to first get a regular account then escalate. Why is this important even if root has a strong password?

When I first saw `PermitRootLogin no`, I thought it was unnecessary if the root password was already strong. Then I realized that security is not only about passwords but also about reducing attack surfaces. If root login is disabled, attackers cannot directly target the most powerful account on the system. They must first compromise a normal user account and then attempt privilege escalation. This creates additional barriers, generates more logs, and gives security tools more opportunities to detect suspicious activity. In the real world, attackers often automate brute-force attacks against the root account because it always exists. By disabling direct root login, we remove that easy target and make the attack path much more difficult, even if the root password itself is strong.

---

## 3. fail2ban reads auth.log and bans IPs. What happens if an attacker spoofs IPs? Does fail2ban help or hurt in that case?

When I first learned about fail2ban, I thought it could stop every brute-force attack automatically. Then I understood that it works by reading log files and blocking IP addresses that repeatedly fail authentication. If an attacker successfully spoofs random IP addresses, fail2ban may end up banning innocent addresses instead of the attacker. However, for services like SSH that require a full TCP connection, IP spoofing is generally ineffective because the attacker must receive responses from the server to complete the connection. In most real SSH attacks, the source IP is genuine, so fail2ban is very effective. The only downside is that if an attacker deliberately triggers failed logins from many different addresses, fail2ban could create a large ban list. Overall, fail2ban helps much more than it hurts because most real-world brute-force attacks use legitimate source IPs.

---

## 4. auditd logs every write to /etc/passwd. On a busy server, the audit log could grow huge. How do you rotate it without missing events?

When I first heard that auditd records security events, I assumed the logs could simply be deleted when they became too large. Then I learned that deleting active audit logs can cause loss of important security evidence. The correct approach is log rotation. Instead of removing the current log, the system renames and archives old logs while auditd continues writing to a new file. Tools such as `logrotate` or auditd's built-in rotation settings can automate this process. The important part is to signal auditd to reopen the log file after rotation so that no events are lost during the switch. On production servers, administrators also compress old logs and keep a retention policy to balance storage usage and compliance requirements. This ensures that security events are preserved while preventing the disk from filling up.
