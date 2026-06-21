
# Task 15 – Production Ready RHEL Linux Server





## Objective

Build a complete production-ready server from a fresh Rocky Linux installation.

### Deliverables

* server_baseline.sh
* system_health.sh
* backup.sh
* Nginx deployed using Podman
* Cron automation
* SELinux Enforcing
* GitHub repository with v1.0 tag

---

# Step 1: Update System

## Command

```bash
sudo dnf update -y
```

## Explanation

Updates all installed packages to the latest version.

## Purpose

Apply security patches and bug fixes.

---

# Step 2: Install Required Packages

## Command

```bash
sudo dnf install -y vim git curl wget podman cronie
```

## Explanation

Installs administration and automation tools.

### Package Breakdown

| Package | Purpose                      |
| ------- | ---------------------------- |
| vim     | Text editor                  |
| git     | Version control              |
| curl    | Download files and test APIs |
| wget    | Download utility             |
| podman  | Container engine             |
| cronie  | Cron scheduler               |

---

# Step 3: Backup SSH Configuration

## Command

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

## Explanation

Creates a backup of the SSH configuration file.

## Purpose

Allows recovery if configuration changes cause issues.

---

# Step 4: Harden SSH

## Command

```bash
sudo nano /etc/ssh/sshd_config
```

Add:

```text
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
```

## Explanation

### PermitRootLogin no

Disables direct root login.

### PasswordAuthentication no

Disables password-based login.

### PubkeyAuthentication yes

Allows SSH key authentication.

## Purpose

Improve server security.

---

# Step 5: Restart SSH Service

## Command

```bash
sudo systemctl restart sshd
```

## Purpose

Apply updated SSH settings.

---

# Step 6: Create Administrative User

## Command

```bash
sudo useradd devopsadmin
```

## Purpose

Creates a dedicated administrator account.

---

# Step 7: Set User Password

## Command

```bash
sudo passwd devopsadmin
```

## Purpose

Assign password to the new user.

---

# Step 8: Grant Sudo Access

## Command

```bash
sudo usermod -aG wheel devopsadmin
```

## Explanation

### usermod

Modify user account.

### -aG

Append user to group.

### wheel

Administrative group in Rocky Linux.

## Purpose

Provide administrator privileges.

---

# Step 9: Create server_baseline.sh

## Command

```bash
nano server_baseline.sh
```

## Script

```bash
#!/bin/bash

dnf update -y
dnf install -y vim git curl wget podman cronie

useradd devopsadmin
usermod -aG wheel devopsadmin

systemctl enable crond
systemctl start crond
```

## Purpose

Automates baseline server setup.

---

# Step 10: Make Script Executable

## Command

```bash
chmod +x server_baseline.sh
```

## Purpose

Allows script execution.

---

# Step 11: Create system_health.sh

## Command

```bash
nano system_health.sh
```

## Script

```bash
#!/bin/bash

echo "===== DISK ====="
df -h

echo "===== MEMORY ====="
free -h

echo "===== CPU ====="
uptime

echo "===== NGINX ====="
systemctl status nginx --no-pager
```

## Purpose

Provides system health information.

---

# Step 12: Make Script Executable

## Command

```bash
chmod +x system_health.sh
```

---

# Step 13: Create Backup Directory

## Command

```bash
sudo mkdir -p /backups
```

## Purpose

Store backup archives.

---

# Step 14: Create backup.sh

## Command

```bash
nano backup.sh
```

## Script

```bash
#!/bin/bash

DATE=$(date +%F)

tar -czf /backups/backup-$DATE.tar.gz /etc

find /backups -type f -mtime +7 -delete
```

## Explanation

### tar -czf

Creates compressed archive.

### /etc

Backs up system configuration files.

### -mtime +7

Finds files older than 7 days.

### -delete

Removes old backups.

## Purpose

Automated backup with rotation.

---

# Step 15: Make Script Executable

## Command

```bash
chmod +x backup.sh
```

---

# Step 16: Create Website Directory

## Command

```bash
mkdir ~/website
```

---

# Step 17: Create Custom Web Page

## Command

```bash
nano ~/website/index.html
```

## Content

```html
<h1>Production Server Running</h1>
```

---

# Step 18: Pull Nginx Image

## Command

```bash
podman pull docker.io/library/nginx
```

## Purpose

Download nginx container image.

---

# Step 19: Deploy Nginx Container

## Command

```bash
podman run -d \
--name nginx-web \
-p 8080:80 \
-v ~/website:/usr/share/nginx/html:Z \
docker.io/library/nginx
```

## Explanation

### -d

Run container in background.

### --name nginx-web

Assign container name.

### -p 8080:80

Map host port 8080 to container port 80.

### -v

Mount website files into container.

### :Z

Apply SELinux context.

---

# Step 20: Verify Deployment

## Command

```bash
curl http://localhost:8080
```

## Expected Output

```html
<h1>Production Server Running</h1>
```

---

# Step 21: Configure Cron Jobs

## Command

```bash
crontab -e
```

Add:

```cron
0 * * * * /home/devanshibarbhaya/system_health.sh >> /tmp/health.log

0 2 * * * /home/devanshibarbhaya/backup.sh
```

## Purpose

### First Job

Runs health checks every hour.

### Second Job

Runs backup every day at 2 AM.

---

# Step 22: Verify SELinux

## Command

```bash
getenforce
```

## Expected Output

```text
Enforcing
```

---

# Step 23: Enable SELinux if Needed

## Command

```bash
sudo setenforce 1
```

## Purpose

Enable SELinux enforcement.

---

# Step 24: Initialize Git Repository

## Command

```bash
git init
```

---

# Step 25: Add Files

## Command

```bash
git add .
```

---

# Step 26: Commit Files

## Command

```bash
git commit -m "Production ready Rocky Linux server"
```

---

# Step 27: Connect GitHub Repository

## Command

```bash
git remote add origin YOUR_GITHUB_REPO_URL

git branch -M main

git push -u origin main
```

---

# Step 28: Create Release Tag

## Command

```bash
git tag -a v1.0 -m "Production Ready Server"
```

## Purpose

Create release version.

---

# Step 29: Push Release Tag

## Command

```bash
git push origin v1.0
```

---

# Final Deliverables

| Deliverable        | Purpose                    |
| ------------------ | -------------------------- |
| server_baseline.sh | Server setup and hardening |
| system_health.sh   | Health monitoring          |
| backup.sh          | Backup automation          |
| Nginx via Podman   | Web service deployment     |
| Cron Jobs          | Task automation            |
| SELinux Enforcing  | Security                   |
| GitHub Repository  | Version control            |
| v1.0 Tag           | Release management         |
