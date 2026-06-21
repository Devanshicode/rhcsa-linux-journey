
# Group - 1 Linux File Viewing, Log Monitoring & Text Processing Commands




<img width="1280" height="800" alt="2" src="https://github.com/user-attachments/assets/dc65ed93-69ea-4695-bc79-6c729a69d4d3" />



<img width="1280" height="800" alt="2 1" src="https://github.com/user-attachments/assets/78495e24-63e1-4735-9f1d-3a708a61abb9" />





| Command                   | What it does                                                    | When I use it                                                            |
| ------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `cat /etc/passwd`         | Displays full content of a file (system user list in this case) | When I want to quickly view complete file content or check system users  |
| `tail -f /var/log/secure` | Shows live updates of a log file in real time                   | When monitoring login attempts, SSH activity, or debugging security logs |
| `grep 'ERROR' log`        | Filters and shows only lines containing "ERROR"                 | When searching for errors in logs or troubleshooting applications        |
| `grep -v '#' config`      | Removes lines containing `#` (comments) and shows clean config  | When reading configuration files without comments                        |
| `awk '{print $1,$3}'`     | Extracts and prints specific columns from structured text       | When I need to extract selected fields from logs or data files           |






# Group - 2 Linux Text Processing & File Viewing Utilities





<img width="1280" height="800" alt="2 2" src="https://github.com/user-attachments/assets/78e6b531-a116-47ff-abb2-92323a885172" />





| Command                    | What it does                                       | When I use it                                                   |
| -------------------------- | -------------------------------------------------- | --------------------------------------------------------------- |
| `sed -n '10,20p' file`     | Displays only specific line range from a file      | When I want to view selected lines (like logs or code sections) |
| `tr 'a-z' 'A-Z'`           | Converts lowercase text to uppercase               | When I need to transform or format text output                  |
| `tee file`                 | Shows output and saves it to a file simultaneously | When I want to log output while still seeing it on screen       |
| `less /var/log/messages`   | Opens large files in scrollable viewer             | When I need to read big log files comfortably                   |
| `tail -n 50 file`          | Shows last 50 lines of a file                      | When checking recent logs or latest updates                     |
| `grep -r 'password' /etc/` | Searches recursively for a keyword in files        | When I need to find a specific text across many files           |





# Group - 3 Linux Text Processing & File Analysis Commands




<img width="1280" height="800" alt="2 3" src="https://github.com/user-attachments/assets/8807e8ba-7f6c-4fa9-ad75-2762acfb0a9e" />




| Command                        | What it does                               | When I use it                                                    |
| ------------------------------ | ------------------------------------------ | ---------------------------------------------------------------- |
| `grep -c 'timeout' log`        | Counts how many lines contain "timeout"    | When checking how many times an error or keyword appears in logs |
| `awk -F: '$3>999' /etc/passwd` | Filters users with UID > 999               | When analyzing system users vs normal users                      |
| `sort -k2 -n file`             | Sorts file based on 2nd column numerically | When ordering data like scores, numbers, or metrics              |
| `diff file1 file2`             | Compares two files and shows differences   | When checking changes between file versions                      |
| `head -20 file`                | Shows first 20 lines of a file             | When quickly previewing logs or large files                      |





# Group - 4 Linux Text Processing & Pipeline Utilities





<img width="1280" height="800" alt="2 4" src="https://github.com/user-attachments/assets/011432d5-1470-4548-be1f-13d792b6e04d" />




| Command                  | What it does                     | When you use it                                  |                                                |
| ------------------------ | -------------------------------- | ------------------------------------------------ | ---------------------------------------------- |
| `wc -l file`             | Counts number of lines in a file | When you need file size in lines or log count    |                                                |
| `grep -i 'fail' file`    | Searches text (case-insensitive) | When filtering logs or finding errors            |                                                |
| `cut -d: -f1 file`       | Extracts specific column/field   | When parsing structured files like `/etc/passwd` |                                                |
| `sed 's/old/new/g' file` | Replaces text in a file          | When modifying or cleaning text data             |                                                |
| `uniq -c sorted.txt`     | Counts duplicate lines           | When analyzing repeated values (after sorting)   |                                                |
| `                        | ` (pipe)                         | Sends output of one command to another           | When chaining multiple commands for processing |










































