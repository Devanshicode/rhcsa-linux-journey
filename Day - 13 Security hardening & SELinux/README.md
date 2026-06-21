
# Group - 1  SELinux Monitoring



<img width="1280" height="800" alt="13 1" src="https://github.com/user-attachments/assets/8f82d08d-7645-4cc3-ba38-18acf9b247d6" />




| Command                          | What It Does                                                 | When I Use It                            |
| -------------------------------- | ------------------------------------------------------------ | ---------------------------------------- |
| `getenforce`                     | Shows current SELinux mode (Enforcing, Permissive, Disabled) | Quick SELinux status check               |
| `sestatus`                       | Displays detailed SELinux information                        | Detailed SELinux investigation           |
| `chcon -t httpd_sys_content_t f` | Changes SELinux file type context                            | Allow web servers to access files        |
| `getsebool -a \| grep http`      | Shows HTTP-related SELinux booleans                          | Troubleshooting Apache/Nginx permissions |
| `audit2allow -w -a`              | Explains SELinux access denials                              | Debugging SELinux permission problems    |




# Group - 2 Linux Security: Fail2Ban, Password Management



<img width="1280" height="800" alt="13 2" src="https://github.com/user-attachments/assets/70359439-4785-4b51-8aa3-6884bd81db95" />




| Command                       | What It Does                                  | When I Use It                      |
| ----------------------------- | --------------------------------------------- | ---------------------------------- |
| `fail2ban-client status sshd` | Shows SSH Fail2Ban jail status and banned IPs | Monitoring brute-force protection  |
| `passwd --stdin username`     | Changes password from command input           | Automation and scripting           |
| `setenforce 0`                | Switches SELinux to permissive mode           | Troubleshooting SELinux issues     |
| `setenforce 1`                | Switches SELinux back to enforcing mode       | Restoring system security          |
| `ls -Z file`                  | Displays SELinux security context of a file   | Checking SELinux labels            |
| `restorecon -Rv /srv/webapp/` | Restores default SELinux contexts recursively | Fixing SELinux permission problems |




# Group - 3 SSH Security & Network Auditing Commands



<img width="1280" height="800" alt="13 3" src="https://github.com/user-attachments/assets/ab85ea7f-de36-459b-b674-9fcd13bb234c" />





| Command                                     | What It Does                                                     | When I Use It                   |
| ------------------------------------------- | ---------------------------------------------------------------- | ------------------------------- |
| `setsebool -P httpd_can_network_connect on` | Allows web server processes to make outbound network connections | Web apps, databases, APIs       |
| `sudo nano /etc/ssh/sshd_config`            | Opens SSH server configuration for hardening                     | Securing remote access          |
| `ss -tulnp`                                 | Displays listening ports and associated processes                | Port audits and troubleshooting |
| `openssl rand -base64 16`                   | Generates secure random strings                                  | Passwords, API keys, secrets    |
| `cat /etc/selinux/config`                   | Displays SELinux configuration                                   | Checking SELinux mode           |
| `ps auxZ \| grep nginx`                     | Shows nginx process with SELinux context                         | SELinux auditing and debugging  |






# Group - 4 Auditing & Service Hardening Commands




<img width="1280" height="800" alt="13 4" src="https://github.com/user-attachments/assets/e78b434c-d30b-4c59-97f6-ea8909bda6be" />




| Command                     | What It Does                              | When I Use It                                      |
| --------------------------- | ----------------------------------------- | -------------------------------------------------- |
| `semanage fcontext`         | Manage SELinux file context rules         | Configure SELinux labels for files and directories |
| `ausearch -m AVC`           | Search SELinux denial events              | Troubleshoot SELinux permission issues             |
| `systemctl disable service` | Prevent service from starting at boot     | Disable unnecessary services                       |
| `auditd`                    | Audit daemon that records security events | Security monitoring and compliance                 |
| `auditctl`                  | Create and manage audit rules             | Track access to files and system activity          |































