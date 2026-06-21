
# Task 13 - Harden a Web Server

## Objective

Secure a Linux web server by restricting SSH access, enabling intrusion protection, reducing attack surface, configuring SELinux correctly, and monitoring critical system files.

---

# Step 1 - Disable Root Login and Password Authentication

## Command

```bash
sudo nano /etc/ssh/sshd_config
```

### Explanation

* `sudo` = run as administrator
* `nano` = text editor
* `/etc/ssh/sshd_config` = SSH server configuration file

### Purpose

Open SSH configuration to harden remote access.

---

## Modify these lines

```ini
PermitRootLogin no
PasswordAuthentication no
```

### Explanation

#### PermitRootLogin no

* Prevents direct root login via SSH.

#### PasswordAuthentication no

* Disables password-based SSH authentication.
* Only SSH keys can be used.

### Purpose

Protect the server against brute-force login attacks.

---

## Restart SSH Service

```bash
sudo systemctl restart sshd
```

### Explanation

* `systemctl` = service manager
* `restart` = stop and start service
* `sshd` = SSH daemon

### Purpose

Apply the configuration changes.

---

# Step 2 - Install and Configure Fail2Ban

## Install Fail2Ban

Ubuntu:

```bash
sudo apt install fail2ban -y
```

RHEL/Rocky:

```bash
sudo dnf install fail2ban -y
```

### Explanation

Installs Fail2Ban security service.

### Purpose

Detect and block repeated login failures.

---

## Start Fail2Ban

```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

### Explanation

#### enable

Starts Fail2Ban automatically after reboot.

#### start

Starts Fail2Ban immediately.

### Purpose

Ensure protection remains active.

---

## Check Status

```bash
sudo systemctl status fail2ban
```

### Purpose

Verify Fail2Ban is running correctly.

---

# Step 3 - Disable Unneeded Services

## View Running Services

```bash
systemctl list-units --type=service
```

### Explanation

Displays active services.

### Purpose

Identify unnecessary services.

---

## Disable Example Services

```bash
sudo systemctl disable bluetooth
sudo systemctl disable cups
sudo systemctl disable avahi-daemon
```

### Explanation

#### bluetooth

Bluetooth support service.

#### cups

Printing service.

#### avahi-daemon

Network discovery service.

### Purpose

Reduce attack surface.

---

## Stop Them Immediately

```bash
sudo systemctl stop bluetooth
sudo systemctl stop cups
sudo systemctl stop avahi-daemon
```

### Purpose

Prevent the services from continuing to run.

---

# Step 4 - Configure SELinux for Nginx

## Create Web Directory

```bash
sudo mkdir -p /srv/webapp
```

### Explanation

* `mkdir` = create directory
* `-p` = create parent directories if needed

### Purpose

Store web content outside default nginx path.

---

## Set SELinux Context

```bash
sudo semanage fcontext -a -t httpd_sys_content_t "/srv/webapp(/.*)?"
```

### Explanation

#### semanage

Manage SELinux policies.

#### fcontext

File context configuration.

#### httpd_sys_content_t

SELinux type allowing nginx access.

### Purpose

Permit nginx to read files inside `/srv/webapp`.

---

## Apply Context

```bash
sudo restorecon -Rv /srv/webapp
```

### Explanation

#### restorecon

Restore SELinux labels.

#### -R

Recursive.

#### -v

Verbose output.

### Purpose

Apply SELinux policy to files.

---

## Verify Context

```bash
ls -Zd /srv/webapp
```

### Purpose

Confirm SELinux label is correct.

---

# Step 5 - Configure Auditd

## Install Auditd

Ubuntu:

```bash
sudo apt install auditd -y
```

RHEL/Rocky:

```bash
sudo dnf install audit -y
```

### Purpose

Install auditing service.

---

## Enable Auditd

```bash
sudo systemctl enable auditd
sudo systemctl start auditd
```

### Purpose

Ensure auditing begins immediately and survives reboot.

---

## Create Audit Rule

```bash
sudo auditctl -w /etc/passwd -p wa -k passwd_changes
```

### Explanation

#### auditctl

Audit configuration tool.

#### -w

Watch file.

#### /etc/passwd

Critical user account file.

#### -p wa

* w = write operations
* a = attribute changes

#### -k passwd_changes

Custom search key.

### Purpose

Log all modifications to user account database.

---

## Verify Rule

```bash
sudo auditctl -l
```

### Purpose

Display active audit rules.

---

## Search Audit Logs

```bash
sudo ausearch -k passwd_changes
```

### Explanation

Search logs using custom key.

### Purpose

View all changes made to `/etc/passwd`.

---

# Step 6 - Verification

## Verify SSH Settings

```bash
sudo grep -E "PermitRootLogin|PasswordAuthentication" /etc/ssh/sshd_config
```

### Purpose

Confirm SSH hardening settings.

---

## Verify Fail2Ban

```bash
sudo systemctl status fail2ban
```

### Purpose

Confirm intrusion protection is active.

---

## Verify Disabled Services

```bash
systemctl is-enabled bluetooth
systemctl is-enabled cups
systemctl is-enabled avahi-daemon
```

### Purpose

Ensure unnecessary services remain disabled.

---

## Verify SELinux Context

```bash
ls -Zd /srv/webapp
```

### Purpose

Confirm nginx can access web content.

---

## Verify Auditd

```bash
sudo auditctl -l
```

### Purpose

Confirm auditing rule is active.



# Key Learning



At first, I thought hardening a web server would mostly be about installing security tools, but I learned that security is built in layers. After changing `PermitRootLogin no` and `PasswordAuthentication no` in `sshd_config`, I realized that SSH access can be completely blocked if key-based authentication is not tested beforehand. This showed me why administrators always verify access before restarting the SSH service.

While configuring Fail2Ban, I expected it to start protecting the server immediately after installation. Instead, I had to create and verify the jail configuration so it could actually detect repeated failed login attempts and ban suspicious IP addresses. Disabling unnecessary services was also more important than I expected because every running service increases the system's attack surface, even if nobody is actively using it.

The SELinux part taught me the biggest lesson. Nginx could not serve files from `/srv/webapp/` even though file permissions looked correct. The issue was the SELinux context, not the Linux permissions. After assigning the correct context and restoring labels, Nginx was able to access the content properly. I also configured `auditd` to monitor all write operations on `/etc/passwd`, which helped me understand how administrators track sensitive system changes and investigate security incidents.

This task felt very similar to what cloud and enterprise teams do in production environments. Before deploying applications on AWS, Azure, or private cloud servers, engineers harden SSH access, deploy intrusion-prevention tools like Fail2Ban, reduce unnecessary services, enforce SELinux policies, and enable auditing for critical files. These controls are part of standard security baselines followed in MNCs to meet compliance requirements and protect production systems from unauthorized access.






















