
# Task - 11: User Provisioning Script


<img width="1280" height="800" alt="task - 11" src="https://github.com/user-attachments/assets/c4f4dd13-f37c-4ca7-a6b5-909b4b9c6059" />




## Objective 
Write a user-provisioning script: takes arguments -u username -g groupname. Creates user, sets temp password, adds to group, sets password expiry 30 days, creates home dir structure (projects/ logs/ scripts/), logs all actions. Run it for 3 users in a for loop. Run shellcheck on it.


## Step 1: Become Root User

Command:
sudo -i

Explanation:

* sudo = Execute command as administrator
* -i = Open root login shell

Purpose:
Gain administrative privileges required for user management.



## Step 2: Create Working Directory

Command:
mkdir -p /root/task11
cd /root/task11

Explanation:

* mkdir = Create directory
* -p = Create parent directories if needed
* cd = Change directory

Purpose:
Create a dedicated workspace.



## Step 3: Create Script File

Command:
vi user_provision.sh

Explanation:

* vi = Text editor
* user_provision.sh = Script filename

Purpose:
Create the provisioning script.



## Step 4: Add Script Content

Paste:

#!/bin/bash

LOGFILE="/var/log/user_provision.log"

while getopts "u:g:" opt
do
case $opt in
u) USERNAME=$OPTARG ;;
g) GROUPNAME=$OPTARG ;;
*) echo "Usage: $0 -u username -g groupname"
exit 1 ;;
esac
done

echo "[$(date)] Starting user creation for $USERNAME" >> $LOGFILE

if ! getent group "$GROUPNAME" > /dev/null
then
groupadd "$GROUPNAME"
echo "[$(date)] Group $GROUPNAME created" >> $LOGFILE
fi

useradd -m "$USERNAME"

echo "TempPass123" | passwd --stdin "$USERNAME"

usermod -aG "$GROUPNAME" "$USERNAME"

chage -M 30 "$USERNAME"

mkdir -p /home/$USERNAME/projects
mkdir -p /home/$USERNAME/logs
mkdir -p /home/$USERNAME/scripts

chown -R $USERNAME:$USERNAME /home/$USERNAME

echo "[$(date)] User $USERNAME created successfully" >> $LOGFILE

Purpose:
Automates user creation, group assignment, password setup, directory creation, password expiry policy, and logging.



## Step 5: Make Script Executable

Command:
chmod +x user_provision.sh

Explanation:

* chmod = Change permissions
* +x = Add execute permission

Purpose:
Allow script execution.



## Step 6: Run Script for One User

Command:
./user_provision.sh -u alice -g developers

Explanation:

* -u = Username
* -g = Group name

Purpose:
Create a user account.



## Step 7: Run Script for 3 Users Using For Loop

Command:
for user in alice bob charlie
do
./user_provision.sh -u $user -g developers
done

Explanation:

* for = Loop statement
* $user = Current loop value

Purpose:
Create multiple users automatically.



## Step 8: Verify Users

Command:
cat /etc/passwd | grep -E "alice|bob|charlie"

Purpose:
Confirm user creation.



## Step 9: Verify Group Membership

Command:
id alice

Purpose:
Check assigned groups.



## Step 10: Verify Password Expiry

Command:
chage -l alice

Purpose:
Confirm 30-day password expiration policy.



##Step 11: Verify Home Directory Structure

Command:
ls -l /home/alice

Purpose:
Verify projects/, logs/, and scripts/ directories.


## Step 12: Verify Logs

Command:
cat /var/log/user_provision.log

Purpose:
Review provisioning activity logs.



## Step 13: Install ShellCheck

Command:
dnf install epel-release -y
dnf install ShellCheck -y

Purpose:
Install shell script analyzer.



## Step 14: Run ShellCheck

Command:
shellcheck user_provision.sh

Purpose:
Validate script syntax and best practices.


# Key Learning 




When I worked on the user provisioning script, I learned how automation can handle user management much faster than creating accounts manually. The script accepts a username and group name as arguments, creates the user account, assigns a temporary password, adds the user to the required group, sets the password expiry policy to 30 days, and automatically builds a standard home directory structure containing projects, logs, and scripts folders. Running the script inside a for loop for multiple users showed how the same process can be repeated consistently without repeating commands one by one.

One thing that stood out was how many small tasks are involved behind a simple "create a user" request. Creating the account alone is not enough—group membership, password policies, directory structure, and logging all need to be handled as part of the process. I also noticed that logging every action makes troubleshooting much easier because there is a record of exactly what happened during execution.

A few issues appeared while testing. If the group did not exist beforehand, adding the user to it failed. Some commands also required root privileges, so the script could not complete successfully when executed as a normal user. I also had to ensure that home directories and subfolders were created correctly for every account and that password expiry settings were applied to the intended user. Running ShellCheck helped identify scripting mistakes and highlighted areas where variables should be quoted properly to avoid unexpected behavior.

This task is very similar to real cloud and enterprise environments where system administrators need to onboard large numbers of employees quickly and consistently. In AWS, Linux servers, and MNC production environments, user provisioning scripts are commonly used to enforce standard configurations, security policies, and access controls while reducing manual effort and human error.

























