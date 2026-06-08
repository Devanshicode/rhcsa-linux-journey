
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



| Command                                                 | What It Does                                                                                         | When I Use It                                                                                                |
| ---------------------------------------------------     | ---------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| `install -m 755 -o root file1 /usr/local/bin/file1.txt` | Copies a file, sets permissions to `755` (`rwxr-xr-x`), and changes owner to `root` in one step.     | When deploying scripts or programs to system directories and setting ownership/permissions at the same time. |
| `chmod u+x,g-w file1.txt`                               | Adds execute permission for the owner and removes write permission from the group.                   | When I want the owner to run a script but prevent group members from modifying it.                           |
| `ls -l file1.txt`                                       | Displays detailed file information including permissions, owner, group, size, and modification date. | When checking who can read, write, or execute a file and verifying permission changes.                       |
| `lsattr file1.txt`                                      | Shows special filesystem attributes such as immutable (`i`) and append-only (`a`).                   | When troubleshooting why a file cannot be modified or checking advanced file protections.                    |
| `setfacl -x u:bob file1.txt`                            | Removes the ACL (Access Control List) entry for user `bob`.                                          | When revoking special permissions previously granted to a specific user.                                     |
| `chmod g+s dir1`                                        | Sets the SGID (Set Group ID) bit on a directory so new files inherit the directory's group.          | When creating shared team directories where all files should belong to the same group automatically.         |

















