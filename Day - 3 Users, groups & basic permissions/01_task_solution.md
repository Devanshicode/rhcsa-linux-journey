
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



# Key Learning


At first I thought creating users was just about running useradd and setting passwords. But while testing, I realized Linux user management is much more than account creation. Adding alice and bob to the devteam group showed how permissions can be managed for multiple users at once instead of configuring access individually. I also learned that sudo privileges are completely separate from normal user accounts, so alice could perform administrative tasks while bob was restricted to regular user operations.

When I started verifying access, I noticed that simply creating a user does not guarantee the expected behavior. I had to check group membership, confirm sudo access for alice, and verify that bob could not execute privileged commands. For carol, locking the account prevented login access, which helped me understand the difference between a user existing on the system and being allowed to authenticate. Testing with su was important because it exposed configuration mistakes immediately instead of assuming everything was correct.

The password aging policy was another thing I had not paid much attention to before. Setting a maximum password age of 60 days and warning users 7 days before expiration showed me how organizations enforce security policies. Without verification using chage, it would have been easy to think the policy was applied when it actually was not. This taught me that validation is just as important as configuration.

This is very similar to what happens in cloud environments and large companies. System administrators regularly create users, assign them to groups, control administrative privileges, enforce password policies, and disable accounts when employees leave a project. The same concepts are used on Linux servers running in AWS, Azure, and enterprise data centers to maintain security, compliance, and proper access control.





















