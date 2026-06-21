
# Task 3: User and Group Management

## Objective

* Create users alice, bob, and carol
* Create group devteam
* Add alice and bob to devteam
* Give alice sudo access
* Set password policy:

  * Maximum age: 60 days
  * Warning before expiry: 7 days
* Lock carol account
* Verify user permissions

---

## Step 1: Create Users

### Create alice

```bash
useradd -m alice
passwd alice
```

Purpose:

* Creates user alice
* Creates /home/alice
* Sets login password

### Create bob

```bash
useradd -m bob
passwd bob
```

Purpose:

* Creates user bob
* Creates /home/bob
* Sets login password

### Create carol

```bash
useradd -m carol
passwd carol
```

Purpose:

* Creates user carol
* Creates /home/carol
* Sets login password

---

## Step 2: Create Group

```bash
groupadd devteam
```

Purpose:

* Creates a new group named devteam

---

## Step 3: Add Users to Group

### Add alice

```bash
usermod -aG devteam alice
```

### Add bob

```bash
usermod -aG devteam bob
```

Purpose:

* Adds alice and bob to devteam
* -a = append
* -G = supplementary group

---

## Step 4: Grant Sudo Access to Alice

```bash
usermod -aG wheel alice
```

Purpose:

* Adds alice to wheel group
* wheel group members can use sudo

---

## Step 5: Verify Group Membership

```bash
id alice
id bob
```

Expected:

* alice belongs to wheel and devteam
* bob belongs to devteam

---

## Step 6: Configure Password Aging

### Alice

```bash
chage -M 60 -W 7 alice
```

### Bob

```bash
chage -M 60 -W 7 bob
```

### Carol

```bash
chage -M 60 -W 7 carol
```

Purpose:

* Password expires after 60 days
* Warning shown 7 days before expiry

---

## Step 7: Verify Password Policy

```bash
chage -l alice
chage -l bob
chage -l carol
```

Expected:

* Maximum password age = 60
* Warning period = 7

---

## Step 8: Lock Carol Account

```bash
passwd -l carol
```

Purpose:

* Prevents carol from logging in

Verify:

```bash
passwd -S carol
```

Expected:

```text
carol LK
```

---

## Step 9: Test Alice

```bash
su - alice
whoami
sudo dnf check-update
exit
```

Expected:

* User switches to alice
* sudo command works

---

## Step 10: Test Bob

```bash
su - bob
whoami
sudo dnf check-update
exit
```

Expected:

* User switches to bob
* sudo access denied

---

## Step 11: Test Carol

```bash
su - carol
```

Expected:

* Login denied because account is locked

---

## Step 12: Verify devteam Members

```bash
getent group devteam
```

Expected:

```text
devteam:x:1003:alice,bob
```

Purpose:

* Confirms alice and bob are members of devteam
