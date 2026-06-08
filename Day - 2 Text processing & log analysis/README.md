
## Group - 1 Text Processing & Log Analysis Commands

<img width="1280" height="800" alt="2 1" src="https://github.com/user-attachments/assets/e68b9602-65e6-4c2e-8786-0e19e75d6f16" />


# Linux Text Processing & Log Analysis Commands

| Command                    | What it Does                                                                            | When I Use It (My Words)                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `cat /etc/passwd`          | Displays the entire contents of the `/etc/passwd` file.                                 | I use it when I want to quickly view all users configured on the Linux system.                |
| `tail -f /var/log/secure`  | Shows the latest lines of a log file and continuously updates as new entries are added. | I use it when I want to monitor logs in real time while troubleshooting or testing something. |
| `grep 'ERROR' log`         | Searches for lines containing the word `ERROR` in the file named `log`.                 | I use it to find specific errors or keywords inside large log files.                          |
| `grep -v '#' config`       | Displays all lines except those containing `#`.                                         | I use it to hide comments and view only the active configuration settings.                    |
| `awk '{print $1,$3}' file` | Prints only the first and third columns from each line of a file.                       | I use it when I need specific fields from structured text data.                               |
| `sed -n '10,20p' file`     | Prints only lines 10 through 20 from a file.                                            | I use it when I need to view a particular section of a large file.                            |
















