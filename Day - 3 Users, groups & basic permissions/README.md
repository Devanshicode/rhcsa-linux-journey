
# Group - 1 Linux User & Group Management Commands



<img width="1280" height="800" alt="3" src="https://github.com/user-attachments/assets/ec6b8ad1-ab15-441b-8a46-e3898d31ed81" />



<img width="1280" height="800" alt="3 1" src="https://github.com/user-attachments/assets/a9ef48de-c108-4da5-be84-07f4894830b6" />




| Command            | What it does                                   | When I use it                                                    |
| ------------------ | ---------------------------------------------- | ---------------------------------------------------------------- |
| `id`               | Shows current user ID, groups, and permissions | When I want to check which user I am and what groups I belong to |
| `passwd alice`     | Changes password of user alice                 | When I need to reset or update a user’s password                 |
| `groupadd devteam` | Creates a new group called devteam             | When setting up role-based access for multiple users             |
| `su - alice`       | Switches current session to user alice         | When I need to work as another user for testing or admin tasks   |
| `cat /etc/passwd`  | Displays all user account information          | When I want to view system users and their details               |
| `chage -l alice`   | Shows password expiry and aging info for alice | When I need to check or audit password policy for a user         |






# Group - 2 Linux User & Group Management + Session Monitoring




<img width="1280" height="800" alt="3 2" src="https://github.com/user-attachments/assets/0e5cc471-313a-40c2-94cc-ef134be94539" />




| Command                   | What it does                                     | When you use it                                          |
| ------------------------- | ------------------------------------------------ | -------------------------------------------------------- |
| `passwd -u alice`         | Unlocks a locked user account password           | When a user is locked and needs login access restored    |
| `w`                       | Shows all logged-in users and their activities   | When you want to monitor active users on the system      |
| `whoami`                  | Displays current logged-in username              | When you need to confirm which user you are operating as |
| `usermod -aG wheel alice` | Adds user to admin (wheel) group for sudo access | When you want to give a user admin privileges            |
| `groupdel devteam`        | Deletes an existing user group                   | When a group is no longer needed or must be removed      |




# Group - 3 Linux User & Security Administration




<img width="1280" height="800" alt="3 3" src="https://github.com/user-attachments/assets/fca9c90e-c450-4a89-aaae-2ec9b77ab3bd" />




| Command             | What it does                                                        | When you use it                                            |
| ------------------- | ------------------------------------------------------------------- | ---------------------------------------------------------- |
| `sudo -l`           | Shows allowed sudo permissions for current user                     | When you want to check what admin commands you can run     |
| `cat /etc/shadow`   | Displays encrypted password and account expiry info (requires root) | When doing security audits or password inspection          |
| `chage -M 90 alice` | Sets password expiry to 90 days for user alice                      | When enforcing password policies or security rules         |
| `last`              | Shows login history of users                                        | When checking system access logs or investigating activity |
| `useradd -m alice`  | Creates a new user with home directory                              | When adding a new user account                             |
| `userdel -r alice`  | Deletes user and removes home directory                             | When removing a user permanently                           |




# Group - 4 User & System Account Management




<img width="1280" height="800" alt="3 4" src="https://github.com/user-attachments/assets/15904e25-27a4-4da5-a37b-c84af33bf318" />




| Command           | What it does                                       | When you use it                                            |
| ----------------- | -------------------------------------------------- | ---------------------------------------------------------- |
| `groups alice`    | Shows all groups a user belongs to                 | When checking user permissions or access level             |
| `visudo`          | Safely edits sudoers file for admin access control | When granting/restricting sudo privileges                  |
| `cat /etc/group`  | Displays system group information file             | When auditing or reviewing system groups                   |
| `passwd -l alice` | Locks a user account password                      | When disabling a user temporarily for security             |
| `lastb`           | Shows failed login attempts                        | When investigating security issues or brute-force attempts |













































