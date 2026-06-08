
# Task : User Management, Groups & Password Policy


<img width="1280" height="800" alt="task 3" src="https://github.com/user-attachments/assets/ce84a5dd-0f10-42bc-9b8f-6d028686d471" />



## Objective 

Create users alice (sudo access), bob (no sudo), carol (locked). Create group 'devteam'. Add alice and bob to devteam. Set password policy: max 60 days, warn 7 days before expiry. Lock carol. Verify by switching to each user and testing what they can and cannot do

---


## Step 1: Switch to root / sudo access

### Command

```bash
sudo -l
```

### Explanation

* `sudo` → runs command with admin privileges
* `-l` → opens root shell session

### Purpose

I need root access to create users, groups, and modify system policies.

---

## Step 2: Create Users

### Command

```bash
useradd alice
useradd bob
useradd carol
```

### Explanation

* `useradd` → creates a new user
* `alice`, `bob`, `carol` → usernames

### Purpose

To create 3 users with different roles:

* alice → admin (sudo access)
* bob → normal user
* carol → locked account

---

## Step 3: Set Passwords for Users

### Command

```bash
passwd alice
passwd bob
passwd carol
```

### Explanation

* `passwd` → sets password for user
* System will prompt to enter password twice

### Purpose

Without password, users cannot log in.

---

## Step 4: Create Group "devteam"

### Command

```bash
groupadd devteam
```

### Explanation

* `groupadd` → creates a new group
* `devteam` → group name

### Purpose

Groups are used to manage permissions collectively.

---

## Step 5: Add Users to Group

### Command

```bash
usermod -aG devteam alice
usermod -aG devteam bob
```

### Explanation

* `usermod` → modify user
* `-aG` → append to group without removing existing groups
* `devteam` → target group

### Purpose

Alice and Bob become part of the same team group for shared access.

---

## Step 6: Give Alice Sudo Access

### Command

```bash
usermod -aG wheel alice
```

### Explanation

* `wheel` group = sudo-enabled group (RHEL-based systems)
* Adding alice here gives admin privileges

### Purpose

Alice becomes administrator user.

---

## Step 7: Set Password Policy

### Command

```bash
chage -M 60 -W 7 alice
chage -M 60 -W 7 bob
chage -M 60 -W 7 carol
```

### Explanation

* `chage` → change password aging policy
* `-M 60` → password expires in 60 days
* `-W 7` → warning starts 7 days before expiry

### Purpose

Improves security by enforcing password rotation.

---

## Step 8: Lock User Carol

### Command

```bash
passwd -l carol
```

### Explanation

* `passwd -l` → locks password
* user cannot log in

### Purpose

Disables account without deleting it (useful for inactive users).

---

## Step 9: Verify Users & Groups

### Command

```bash
id alice
id bob
id carol
```

### Explanation

Shows:

* UID
* GID
* Group memberships

### Purpose

To confirm correct user configuration.

---

## Step 10: Test Access by Switching Users

### Command

```bash
su - alice
su - bob
su - carol
```

### Explanation

* `su -` → switch user session
* tests login access

### Expected Behavior

* alice → can use sudo
* bob → normal access only
* carol → login fails (locked)

---

## Step 11: Verify sudo access

### Command

```bash
sudo whoami
```

### Expected Output (for alice)

```bash
root
```

### Purpose

Confirms alice has admin privileges.

---

# Final Verification Commands

```bash
getent group devteam
passwd -S alice
passwd -S carol
```

---

# Summary Table

| Command       | What It Does                | When I Use It                |
| ------------- | --------------------------- | ---------------------------- |
| `useradd`     | Creates new user            | When adding new system users |
| `passwd`      | Sets/locks password         | To manage login security     |
| `groupadd`    | Creates group               | To manage users collectively |
| `usermod -aG` | Adds user to group          | To assign permissions        |
| `chage`       | Sets password expiry policy | To enforce security rules    |
| `passwd -l`   | Locks user account          | To disable user access       |
| `id`          | Shows user info             | To verify configuration      |
| `su -`        | Switch user                 | To test access levels        |

---

# Key Learning

This task helped me understand that Linux security is based on **user roles, group membership, and authentication policies**.

* Users define identity
* Groups define shared permissions
* Password policies enforce security
* Account locking controls access without deletion

This is a fundamental concept used in real servers, cloud systems, and DevOps environments where managing access control is critical.




# Key Insights I Learned


When I started this task, I thought Linux user management would just be about creating users and giving passwords, but while working through it I realized there is a proper structure behind how real systems control access.


I assumed adding users to a group like devteam would automatically give some kind of visible permission difference in the terminal, but actually nothing “visual” changes. The real difference is in background permissions and how the system checks access. Also, when I used chage, I didn’t expect Linux to already have built-in password aging controls — I thought that was something external or manual.

At one point I almost used usermod -G instead of usermod -aG, and I learned that -G replaces existing groups while -aG appends. That small difference can silently remove a user from important groups like wheel, which would break sudo access. Also locking carol with passwd -l was confusing at first because the account still exists — it just cannot authenticate.

This is exactly how real production systems are controlled in companies and cloud environments like AWS. Instead of manually managing access on one machine, teams use user groups, IAM policies, and password rules at scale. Locking a user instead of deleting is common when employees leave temporarily or during security incidents. The idea is simple: never delete identity immediately — just disable access and keep audit history. That is exactly what happens in real Linux servers running in production.


















