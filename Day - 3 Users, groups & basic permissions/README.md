
## Group 1 User & Account Management Fundamentals


<img width="1280" height="800" alt="3 1" src="https://github.com/user-attachments/assets/7cd31a38-e494-4c46-9eaf-c41527c8a265" />



| Command                 | What it Does                                                                         | Example Output                                                                                                   | When I Use It (My Understanding)                                                                                                                                                  |
| ----------------------- | ------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id`                    | Displays the current user's UID (User ID), GID (Group ID), and group memberships.    | `uid=1001(alice) gid=1001(alice) groups=1001(alice),1002(devteam)`                                               | I use `id` whenever I want to verify which user I am currently logged in as and what groups I belong to. It is useful for checking permissions and troubleshooting access issues. |
| `sudo passwd alice`     | Changes or sets the password for the user `alice`.                                   | `New password: Retype new password: passwd: all authentication tokens updated successfully.`                     | I use this when creating a new user or when a user forgets their password. As an administrator, I can reset passwords without knowing the old one.                                |
| `sudo groupadd devteam` | Creates a new group named `devteam`.                                                 | *(No output if successful)*                                                                                      | I use this when I want multiple users to share permissions on files and directories. Groups make permission management much easier.                                               |
| `su - alice`            | Switches from the current user to the `alice` account and loads Alice's environment. | `[alice@localhost ~]$`                                                                                           | I use this when I want to test commands exactly as another user would experience them, without logging out of my current account.                                                 |
| `cat /etc/passwd`       | Displays the contents of the system user database file.                              | `root:x:0:0:root:/root:/bin/bash alice:x:1001:1001::/home/alice:/bin/bash`                                       | I use this to view information about user accounts, home directories, default shells, and user IDs stored on the system.                                                          |
| `chage -l alice`        | Displays password aging and expiration information for user `alice`.                 | `Last password change : Jun 08, 2026 Password expires : never Password inactive : never Account expires : never` | I use this to check password policies, expiration dates, and account aging settings. This is important for security and compliance.                                               |



## Group 2 User & Group Administration Essentials




<img width="1280" height="800" alt="3 2" src="https://github.com/user-attachments/assets/f8dd3de0-f4da-4c3f-92e0-b759931c18e2" />




| Command                   | What it does                                           | When I use it                                                                            |
| ------------------------- | ------------------------------------------------------ | ---------------------------------------------------------------------------------------- |
| `whoami`                  | Shows the currently logged-in username.                | I use it when I want to confirm which account I am working with before running commands. |
| `w`                       | Displays logged-in users and their current activities. | I use it to monitor who is connected to the system and what they are doing.              |
| `passwd -u alice`         | Unlocks the account of user `alice`.                   | I use it when a user account has been locked and needs access restored.                  |
| `usermod -aG wheel alice` | Adds `alice` to the `wheel` administrative group.      | I use it when granting sudo or administrative privileges to a user.                      |
| `groupdel devteam`        | Deletes the group named `devteam`.                     | I use it when a group is no longer required in the system.                               |





## Group - 3 User & Password Administration Commands




<img width="1280" height="800" alt="3 3" src="https://github.com/user-attachments/assets/6ad73004-33bb-4031-af70-08fff1fd6e7e" />




| Command                  | What It Does                                            | When I Use It                                                |
| ------------------------ | ------------------------------------------------------- | ------------------------------------------------------------ |
| `sudo -l`                | Lists sudo permissions for the current user             | To check what administrative actions I am allowed to perform |
| `sudo cat /etc/shadow`   | Displays password hashes and password-aging information | To inspect password-related account information              |
| `sudo chage -M 90 alice` | Sets password expiration to 90 days                     | To enforce password rotation policies                        |
| `last`                   | Shows login history                                     | To investigate user logins and system access                 |
| `sudo useradd -m pen`    | Creates a user and home directory                       | When adding a new user to the system                         |
| `sudo userdel -r pen`    | Removes a user and their home directory                 | When removing a user from the system                         |





## Group - 4 User & Group Administration Commands



<img width="1280" height="800" alt="3 4" src="https://github.com/user-attachments/assets/d7b07415-eb17-4e27-9787-9b86c669035d" />




| Command                | What It Does                      | When I Use It                             |
| ---------------------- | --------------------------------- | ----------------------------------------- |
| `groups alice`         | Shows groups of user alice        | To check user permissions and memberships |
| `sudo visudo`          | Safely edits sudoers file         | To grant or modify sudo access            |
| `cat /etc/group`       | Displays all groups on the system | To inspect group information              |
| `sudo passwd -l alice` | Locks user account password       | To temporarily disable user access        |
| `sudo lastb`           | Shows failed login attempts       | To investigate security incidents         |









