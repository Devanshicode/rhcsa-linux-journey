
# Group - 1 Linux File & Directory Management Commands









| Command                             | What It Does                            | When To Use                                         |
| ----------------------------------- | --------------------------------------- | --------------------------------------------------- |
| `pwd`                               | Shows current directory path            | When you want to know where you are                 |
| `cd /path`                          | Changes directory                       | To move between folders                             |
| `touch file.txt`                    | Creates an empty file                   | To create a new file quickly                        |
| `rm -rf dir/`                       | Deletes folder and contents permanently | To remove unwanted directories                      |
| `find / -name file.txt 2>/dev/null` | Searches for files and hides errors     | To locate files across the system                   |
| `stat file.txt`                     | Shows detailed file metadata            | To inspect file permissions, size, timestamps, etc. |




# Group - 2 File & Directory Management Commands









| Command                    | What It Does                                         | When To Use                                           |
| -------------------------- | ---------------------------------------------------- | ----------------------------------------------------- |
| `ln -s /etc/hosts mylink`  | Creates a symbolic (soft) link                       | Create shortcuts to files/directories                 |
| `rmdir emptydir/`          | Removes an empty directory                           | Delete folders that contain no files                  |
| `ls -la`                   | Lists all files with details, including hidden files | Inspect directory contents and permissions            |
| `cd ..`                    | Moves to the parent directory                        | Navigate upward in the filesystem                     |
| `cp -r src/ dst/`          | Copies a directory and its contents                  | Backup or duplicate folders                           |
| `find /etc -name '*.conf'` | Finds all `.conf` files under `/etc`                 | Search configuration files for audits/troubleshooting |







# Group - 3 Linux File & Directory Exploration Commands








| Command           | What It Does                                             | When to Use                        |
| ----------------- | -------------------------------------------------------- | ---------------------------------- |
| `locate filename` | Finds files using a database                             | Quickly locate files on the system |
| `which python3`   | Shows executable path                                    | Verify installed program location  |
| `tree /etc -L 2`  | Displays directory structure up to 2 levels              | Explore folders and configurations |
| `ls -lh`          | Lists files with detailed information and readable sizes | Check permissions and file sizes   |
| `mkdir -p a/b/c`  | Creates nested directories                               | Build directory structures quickly |






# Group - 4 Linux File & System Navigation Commands







| Command            | What it does                        | When to use it                     | 
| ------------------ | ----------------------------------- | ---------------------------------- | 
| `mv old new`       | Move or rename files/directories    | When renaming files or moving data | 
| `find . -mtime -3` | Finds files modified in last 3 days | Checking recent changes or logs    | 
| `file /bin/bash`   | Identifies file type                | When you don’t know file format    | 
| `whereis nginx`    | Locates binary, source, docs        | When finding software location     | 
| `basename /path`   | Extracts filename from path         | When you only need file name       | 
| `dirname /path`    | Extracts directory from path        | When you need folder path only     | 


















