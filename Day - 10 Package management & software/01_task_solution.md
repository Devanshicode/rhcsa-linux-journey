
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

---

## Result

Successfully installed Development Tools and required packages, located nginx configuration files, identified package ownership of `/usr/bin/ssh`, simulated package installation, and restored the system using `dnf history undo`.
