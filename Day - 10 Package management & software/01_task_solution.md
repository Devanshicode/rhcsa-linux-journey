
# Task-10: Package Management and DNF Rollback

## Objective

* Install Development Tools group.
* Install nginx, python3, git, vim and tree.
* Locate nginx configuration files.
* Identify package owning `/usr/bin/ssh`.
* Simulate package installation and rollback using DNF history.

---

## Step 1: Refresh Repository Metadata

### Command

```bash
sudo dnf makecache
```

### Explanation

* `sudo` = run as administrator
* `dnf` = package manager
* `makecache` = refresh repository metadata

### Purpose

Ensures latest package information is available.

---

## Step 2: Install Development Tools Group

### Command

```bash
sudo dnf groupinstall "Development Tools" -y
```

### Explanation

* `groupinstall` installs a predefined package collection.
* `"Development Tools"` contains compiler and build utilities.
* `-y` automatically confirms installation.

### Purpose

Provides development tools such as GCC, Make and GDB.

---

## Step 3: Verify Group Installation

### Command

```bash
sudo dnf group list installed
```

### Purpose

Confirms Development Tools group is installed.

---

## Step 4: Install Required Packages

### Command

```bash
sudo dnf install nginx python3 git vim tree -y
```

### Explanation

* `nginx` = web server
* `python3` = Python interpreter
* `git` = version control system
* `vim` = text editor
* `tree` = directory structure viewer

### Purpose

Installs all required software packages.

---

## Step 5: Verify Installed Packages

### Command

```bash
rpm -q nginx python3 git vim-enhanced tree
```

### Purpose

Displays installed package versions.

---

## Step 6: Verify Nginx Installation

### Command

```bash
nginx -v
```

### Purpose

Shows nginx version and confirms installation.

---

## Step 7: Find Nginx Configuration Files

### Command

```bash
rpm -ql nginx
```

### Explanation

* `rpm` = RPM package utility
* `-q` = query package
* `-l` = list files installed by package

### Purpose

Lists all files installed by nginx.

### Filter Configuration Files

```bash
rpm -ql nginx | grep /etc
```

### Important Result

```text
/etc/nginx/nginx.conf
```

---

## Step 8: Identify Package Owning SSH Binary

### Command

```bash
rpm -qf /usr/bin/ssh
```

### Explanation

* `-f` = determine package owning a file

### Purpose

Identifies which package installed SSH.

### Expected Result

```text
openssh-clients
```

---

## Step 9: View Transaction History

### Command

```bash
sudo dnf history
```

### Purpose

Displays previous package installation and removal transactions.

---

## Step 10: Simulate a Package Installation

### Command

```bash
sudo dnf install cowsay -y
```

### Purpose

Creates a transaction that can later be rolled back.

---

## Step 11: Verify Installation

### Command

```bash
rpm -q cowsay
```

### Purpose

Confirms package installation.

---

## Step 12: Find Transaction ID

### Command

```bash
sudo dnf history
```

### Purpose

Locate the transaction ID associated with the cowsay installation.

---

## Step 13: Undo Transaction

### Command

```bash
sudo dnf history undo <transaction-id>
```

Example:

```bash
sudo dnf history undo 15
```

### Explanation

* `undo` reverses the specified transaction.
* Transaction ID identifies which operation should be reverted.

### Purpose

Removes all packages installed during that transaction.

---

## Step 14: Verify Rollback

### Command

```bash
rpm -q cowsay
```

### Expected Result

```text
package cowsay is not installed
```

### Purpose

Confirms rollback completed successfully.




# Key Learning



While working on package management, I learned that Linux provides multiple ways to inspect installed software beyond just installing packages. After installing the Development Tools group along with nginx, python3, git, vim, and tree, I used package-query commands to explore how software is organized inside the system. Using `rpm -ql nginx` showed the exact locations of nginx configuration files, service files, and directories. I also used `rpm -qf /usr/bin/ssh` to trace a file back to the package that owns it. This helped me understand that every installed file on a Linux system is tracked by an RPM package, making troubleshooting and auditing much easier.

Another interesting part was working with package rollback. I initially thought package installations were permanent unless manually removed, but DNF keeps a transaction history of everything installed, updated, or removed. By intentionally installing an older package version and then checking `dnf history`, I was able to identify the transaction ID and use `dnf history undo` to revert the change. The rollback process restored the system to its previous state without requiring manual cleanup, which showed me how powerful package management tools can be.

This task also highlighted the importance of documenting command outputs. Some commands generated much more information than expected, especially package file listings and transaction histories. I had to carefully verify package versions and transaction IDs before performing the rollback to avoid undoing the wrong change. Understanding these details helped me avoid mistakes and made troubleshooting easier.

The concepts from this task directly connect to real cloud and enterprise environments. System administrators frequently audit package ownership, verify configuration file locations, and track software changes on production servers. In AWS, Azure, and large MNC environments, package history and rollback capabilities are critical when a software update causes issues. Being able to identify package ownership, locate configuration files, and safely reverse changes is an essential skill for maintaining stable and reliable Linux servers.





















Successfully installed Development Tools and required packages, located nginx configuration files, identified package ownership of `/usr/bin/ssh`, simulated package installation, and restored the system using `dnf history undo`.
