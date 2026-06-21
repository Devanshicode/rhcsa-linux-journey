
# Group - 1 Package Management




<img width="1280" height="800" alt="10 1" src="https://github.com/user-attachments/assets/956a07be-3430-4418-bc94-dd0dd9c410a5" />




| Command                   | What it does                                      | When you use it                                 |
| ------------------------- | ------------------------------------------------- | ----------------------------------------------- |
| `dnf install nginx`       | Installs Nginx web server and dependencies        | When setting up a web server or new software    |
| `dnf update nginx`        | Updates Nginx to latest available version         | When fixing bugs or getting latest features     |
| `dnf search nginx`        | Searches package repository for matching software | When you are unsure of exact package name       |
| `dnf history`             | Shows all install/update/remove actions           | When troubleshooting or rollback is needed      |
| `rpm -qa`                 | Lists all installed RPM packages                  | When auditing system software                   |
| `rpm -qf /usr/sbin/nginx` | Finds which package owns a file                   | When debugging file origin or dependency issues |






# Group - 2 DNF Package Inspection




<img width="1280" height="800" alt="10 2 1" src="https://github.com/user-attachments/assets/76185210-1a7b-4d5e-9545-ddcecbdcbda1" />





<img width="1280" height="800" alt="10 2" src="https://github.com/user-attachments/assets/b479f877-4693-404f-bf74-4ebda840dd24" />




| Command                     | What it does                                 | When to use                                             |
| --------------------------- | -------------------------------------------- | ------------------------------------------------------- |
| `dnf provides /usr/bin/git` | Finds which package contains a specific file | When you know a file/command but not its package source |
| `dnf remove httpd`          | Uninstalls Apache web server package         | When you want to delete unwanted software/service       |
| `dnf list installed`        | Shows all installed packages on system       | When checking system software inventory                 |
| `dnf info nginx`            | Displays detailed info about nginx package   | When evaluating a package before install or update      |
| `dnf history undo N`        | Reverses a previous package transaction      | When a recent system change needs to be rolled back     |







# Group - 3 RPM + DNF Operations




<img width="1280" height="800" alt="10 3 1" src="https://github.com/user-attachments/assets/7b8c2eae-3565-4be9-9692-53d15016fd1c" />




<img width="1280" height="800" alt="10 3" src="https://github.com/user-attachments/assets/08be0456-0902-43fb-9308-af1b67b40521" />





| Command                | What it does                                             | When you use it                                                                       |
| ---------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| `rpm -qi nginx`        | Displays detailed info about installed nginx package     | When you want to check version, installation details, or verify if nginx is installed |
| `rpm -ivh package.rpm` | Installs a local RPM file manually with progress display | When installing software from a downloaded `.rpm` file                                |
| `dnf autoremove`       | Removes unused dependencies and cleanup packages         | When system has leftover packages after uninstalling software                         |
| `dnf update`           | Updates all installed system packages to latest versions | When performing system maintenance or security updates                                |
| `dnf list available`   | Shows all packages available in repositories             | When searching for software before installation                                       |





# Group - 4 Package & Repository Management





<img width="1280" height="800" alt="10 4" src="https://github.com/user-attachments/assets/d2153e55-330f-4801-84ef-28cc9d930849" />





| Command                         | What it does                                  | When you use it                                                  |
| ------------------------------- | --------------------------------------------- | ---------------------------------------------------------------- |
| `dnf repolist`                  | Shows all enabled software repositories       | When checking available package sources or debugging repo issues |
| `dnf groupinstall`              | Installs a group of related packages together | When setting up development environments or full toolsets        |
| `rpm -ql nginx`                 | Lists all files installed by a package        | When you want to inspect what a package installed                |
| `dnf config-manager --add-repo` | Adds a new software repository                | When installing software not available in default repos          |
| `dnf clean all`                 | Clears cached package data                    | When fixing installation errors or freeing disk space            |















