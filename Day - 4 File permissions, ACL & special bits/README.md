
## Group - 1 Linux Permissions & Security Commands



<img width="1280" height="800" alt="4 1" src="https://github.com/user-attachments/assets/10564e4b-5c77-4bce-9dd5-cdff6bac3fe5" />





| Command                       | What it does                                | When I use it                          |
| ------------------------      | ------------------------------------------- | -------------------------------------- |
| chmod 750 dir/                | Sets access rights for owner, group, others | When I want secure directory access    |
| chgrp devteam file1.txt       | Changes file group ownership                | When sharing file with a team          |
| chattr +i file1.txt           | Makes file unchangeable or undeletable      | To protect important system files      |
| setfacl -m u:bob:rx file1.txt | Gives specific user custom permissions      | When one user needs special access     |
| chmod u+s file1.txt           | Runs file with owner permissions            | For system programs needing root power |
| find / -perm /4000            | Finds all SUID files                        | For system security audit              |




## Group - 2 Linux Permissions & Security Commands



<img width="1280" height="800" alt="4 2" src="https://github.com/user-attachments/assets/5b132d5d-c5bb-4b15-839e-7909761c040c" />



| Command                                                     | What It Does                                                                                         | When I Use It                                                                                                |
| ---------------------------------------------------         | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `install -m 755 -o root file1.txt /usr/local/bin/file1.txt` | Copies a file, sets permissions to `755` (`rwxr-xr-x`), and changes owner to `root` in one step.     | When deploying scripts or programs to system directories and setting ownership/permissions at the same time. |
| `chmod u+x,g-w file1.txt`                                   | Adds execute permission for the owner and removes write permission from the group.                   | When I want the owner to run a script but prevent group members from modifying it.                           |
| `ls -l file1.txt`                                           | Displays detailed file information including permissions, owner, group, size, and modification date. | When checking who can read, write, or execute a file and verifying permission changes.                       |
| `lsattr file1.txt`                                          | Shows special filesystem attributes such as immutable (`i`) and append-only (`a`).                   | When troubleshooting why a file cannot be modified or checking advanced file protections.                    |
| `setfacl -x u:bob file1.txt`                                | Removes the ACL (Access Control List) entry for user `bob`.                                          | When revoking special permissions previously granted to a specific user.                                     |
| `chmod g+s dir1`                                            | Sets the SGID (Set Group ID) bit on a directory so new files inherit the directory's group.          | When creating shared team directories where all files should belong to the same group automatically.         |




## Group -3 Linux File Permissions & Ownership Management


<img width="1280" height="800" alt="4 3" src="https://github.com/user-attachments/assets/5687b419-d26b-4200-bc7f-d72943fd86f6" />




| Command                 | What It Does                                                                                                                                                                                                    | When I Use It                                                                                                                                                         |
| ----------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `find / -perm /2000`    | Searches the entire system for files or directories that have the **SGID (Set Group ID)** permission set. SGID causes files created inside certain directories to inherit the directory's group ownership.      | When performing security audits, checking special permissions, or investigating how group ownership is being inherited in shared directories.                         |
| `stat -c %a file`       | Displays the file's permissions in numeric (octal) format such as `644`, `755`, or `777`. The `%a` option prints only the permission bits.                                                                      | When verifying file permissions before changing them with `chmod`, troubleshooting access issues, or documenting security settings.                                   |
| `chown user:group file` | Changes the owner and group ownership of a file or directory. The user becomes the owner and the specified group becomes the group owner.                                                                       | When assigning files to the correct user account, configuring application directories, managing shared resources, or fixing permission problems after file transfers. |
| `umask 027`             | Sets the default permission mask for newly created files and directories. A mask of `027` removes write permissions for the group and all permissions for others, resulting in more secure default permissions. | When configuring secure environments where files should not be accessible by unauthorized users. Common in production servers and multi-user systems.                 |
















