
# Group - 1 Linux Permissions & File Access Control






| Command                    | What it does                                                   | When I use it                                                                |
| -------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `chmod 750 dir/`           | Sets file permissions (owner full, group limited, others none) | When you want to restrict directory access to only owner and team            |
| `chgrp devteam file`       | Changes group ownership of file                                | When you want to assign a file to a specific team/group                      |
| `chattr +i file`           | Makes file immutable (cannot be modified/deleted)              | When you want to protect critical files from accidental or malicious changes |
| `setfacl -m u:bob:rx file` | Gives specific user custom permissions using ACL               | When normal chmod is not enough and you need per-user access control         |
| `chmod +s file` (SUID)     | Runs file with owner privileges                                | When a program needs elevated privileges temporarily (like passwd command)   |






# Group - 2 System Utility Commands






| Command                  | What it does                                                | When you use it                                               |
| ------------------------ | ----------------------------------------------------------- | ------------------------------------------------------------- |
| `find / -perm /4000`     | Finds all SUID files in system                              | When auditing security or checking privilege escalation risks |
| `install -m 755 -o root` | Installs file with specific permissions and owner           | When deploying scripts/programs system-wide                   |
| `chmod u+x,g-w file`     | Changes file permissions (user execute, remove group write) | When fixing or tightening file access control                 |
| `ls -l`                  | Shows detailed file listing with permissions                | When checking ownership, permissions, and file info           |
| `lsattr file`            | Shows special filesystem attributes of a file               | When debugging protected or locked files                      |




# Group - 3 File Permissions & Ownership Control






| Command                 | What it does                                       | When I use it                                                                               |
| ----------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| `setfacl -x u:bob file` | Removes ACL permission for a specific user         | When you want to revoke access of a specific user without changing normal chmod permissions |
| `chmod g+s dir/`        | Enables SGID so files inherit group of directory   | When working on shared folders/projects where group consistency is needed                   |
| `find / -perm /2000`    | Finds files with SGID permission set               | When auditing system permissions or checking special permission files                       |
| `stat -c %a file`       | Shows numeric file permissions (e.g., 755)         | When you need to quickly check exact permission values                                      |
| `chown user:group file` | Changes file owner and group                       | When transferring file ownership to another user/team                                       |
| `umask 027`             | Sets default permission restrictions for new files | When configuring system security defaults for users/services                                |





# Group - 4 Access Control Toolkit






| Command             | What it does                                                                         | When I use it                                                           |
| ------------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------- |
| `getfacl file`      | Displays detailed ACL permissions of a file or directory                             | When I need to check hidden or advanced permissions beyond `chmod`      |
| `setfacl -b file`   | Removes all ACL rules and resets file to normal permission system                    | When ACL settings are confusing or need cleanup                         |
| `chmod +t dir/`     | Enables sticky bit so only file owners can delete their files inside a shared folder | When multiple users share a directory like `/tmp` or project folders    |
| `newgrp devteam`    | Switches current session to a different group temporarily                            | When I want newly created files to belong to a specific group           |
| `chmod -R 750 dir/` | Applies secure recursive permissions to a folder structure                           | When setting secure access for projects, servers, or deployment folders |




































