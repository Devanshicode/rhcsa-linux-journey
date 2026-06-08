
## Group - 1 Text Processing & Log Analysis Commands

<img width="1280" height="800" alt="2 1" src="https://github.com/user-attachments/assets/e68b9602-65e6-4c2e-8786-0e19e75d6f16" />



| Command                    | What it Does                                                                            | When I Use It (My Words)                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| `cat /etc/passwd`          | Displays the entire contents of the `/etc/passwd` file.                                 | I use it when I want to quickly view all users configured on the Linux system.                |
| `tail -f /var/log/secure`  | Shows the latest lines of a log file and continuously updates as new entries are added. | I use it when I want to monitor logs in real time while troubleshooting or testing something. |
| `grep 'ERROR' log`         | Searches for lines containing the word `ERROR` in the file named `log`.                 | I use it to find specific errors or keywords inside large log files.                          |
| `grep -v '#' config`       | Displays all lines except those containing `#`.                                         | I use it to hide comments and view only the active configuration settings.                    |
| `awk '{print $1,$3}' file` | Prints only the first and third columns from each line of a file.                       | I use it when I need specific fields from structured text data.                               |
| `sed -n '10,20p' file`     | Prints only lines 10 through 20 from a file.                                            | I use it when I need to view a particular section of a large file.                            |





## Group 2: Data Inspection & Monitoring

<img width="1280" height="800" alt="2 2" src="https://github.com/user-attachments/assets/fc8ef2d0-5740-4ddd-abba-2eee2430800a" />


| Command                     | What it Does                                                            | When I Use It                                                            |
| --------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `tr 'a-z' 'A-Z'`            | Converts lowercase letters to uppercase.                                | When I need to change text format, e.g., convert output to uppercase.    |
| `tee file.txt`              | Displays output on the screen and saves it to a file at the same time.  | When I want to view command output and keep a copy in a file.            |
| `less /var/log/messages`    | Opens a file page-by-page for easy reading.                             | When a file is too large to view comfortably with `cat`.                 |
| `tail -n 50 file.txt`       | Shows the last 50 lines of a file.                                      | When I want to check recent entries in logs or data files.               |
| `grep -r "password" /etc/`  | Recursively searches for the word `password` in all files under `/etc`. | When I need to find specific text inside multiple files and directories. |
| `grep -c "timeout" log.txt` | Counts how many times the word `timeout` appears in a file.             | When I need a quick count of matching entries without displaying them.   |






## Group - 3 File Investigation Commands


<img width="1280" height="800" alt="2 3" src="https://github.com/user-attachments/assets/e58c7e6c-a2e0-4f2e-85a0-e8d03782b246" />


| Command                        | What it does                                                                          | When I use it                                                                          |
| ------------------------------ | ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| `awk -F: '$3>999' /etc/passwd` | Uses `:` as a separator and displays users whose UID (3rd field) is greater than 999. | I use it when I want to filter specific data from a file based on conditions.          |
| `sort -k2 -n file`             | Sorts the contents of a file numerically using the 2nd column.                        | I use it when I need data arranged in ascending numerical order by a particular field. |
| `diff file1 file2`             | Compares two files and shows the differences between them.                            | I use it when I want to check changes between two versions of a file.                  |
| `head -20 file`                | Displays the first 20 lines of a file.                                                | I use it when I want a quick preview of a large file without opening the entire file.  |
| `wc -l file`                   | Counts the total number of lines in a file.                                           | I use it when I need to know how many records or lines a file contains.                |
| `grep -i 'fail' log`           | Searches for the word `fail` in a file, ignoring uppercase and lowercase differences. | I use it when I want to quickly find specific keywords in logs or text files.          |







## Group - 4  Content Processing Commands


<img width="1280" height="800" alt="2 4" src="https://github.com/user-attachments/assets/aa1d42d0-2656-4483-a92f-fedd04cf0ba1" />



| Command                   | What it does                                                | When I use it                                                                                    |                                                                                  |
| ------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------- |
| `cut -d: -f1 /etc/passwd` | Extracts specific fields from text using `:` as a separator | I use it when I need only a particular column from a file, such as usernames from `/etc/passwd`. |                                                                                  |
| `sed 's/old/new/g' file`  | Replaces text patterns in a file or output                  | I use it when I want to quickly modify words or values without editing the file manually.        |                                                                                  |
| `uniq -c sorted.txt`      | Counts repeated consecutive lines                           | I use it when I need to find duplicate entries and see how many times they occur.                |                                                                                  |
| `                         | ` (pipe)                                                    | Passes output of one command to another command                                                  | I use it when I want to combine multiple commands and process data step by step. |










