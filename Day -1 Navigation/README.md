# Day-1 Navigation, Files and Directories

## RHCSA Linux on Oracle VirtualBox | 

### Group 1 - Where am I? What is here?

<img width="1280" height="800" alt="1st" src="https://github.com/user-attachments/assets/2700280f-511b-48e6-9927-ee55574bc59f" />

| Command  | What it does                                                                                                                                | When I use it                                                              |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `pwd`    | Displays the current working directory path.                                                                                                | When I need to know my current location in the Linux filesystem.           |
| `ls`     | Lists files and directories in the current directory.                                                                                       | When I want to view the contents of a directory.                           |
| `ls -la` | Lists all files and directories, including hidden files, with detailed information such as permissions, owner, size, and modification date. | When I need detailed information about files or want to view hidden files. |




### Group 2 – Creating and Managing Files & Directories

<img width="1280" height="800" alt="2" src="https://github.com/user-attachments/assets/91709196-6dbe-4246-93f6-2e220973b142" />

| Command                                   | What it does                                                                                    | When I use it                                                                 |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| `ls -lh`                                  | Lists files and directories in a human-readable format, displaying file sizes in KB, MB, or GB. | When I want to quickly understand file sizes without reading raw byte values. |
| `cd ..`                                   | Moves to the parent directory of the current location.                                          | When I need to navigate one level up in the filesystem hierarchy.             |
| `cd`                                      | Returns to the user's home directory.                                                           | When I want to quickly return to my starting workspace.                       |
| `mkdir project`                           | Creates a new directory named `project`.                                                        | When I need a dedicated folder to store related files.                        |
| `touch project/file1.txt`                 | Creates an empty file named `file1.txt` inside the `project` directory.                         | When I need to create a new file for testing, notes, or configuration.        |
| `touch project/file2.txt`                 | Creates an empty file named `file2.txt` inside the `project` directory.                         | When I need multiple files within a project structure.                        |
| `cp -r project backup_project`            | Creates a recursive copy of the entire `project` directory and its contents.                    | When I want to back up a directory before making changes.                     |
| `mv project/file1.txt project/report.txt` | Renames `file1.txt` to `report.txt` within the `project` directory.                             | When I need to rename a file or reorganize files within a directory.          |




### Group 3 – Directory Management and Cleanup


<img width="1280" height="800" alt="3" src="https://github.com/user-attachments/assets/fe27baf7-85af-460a-b023-d2606815a43e" />


| Command                 | What it does                                                                            | When I use it                                                                      |
| ----------------------- | --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| `mkdir emptydir`        | Creates a new empty directory named `emptydir`.                                         | When I need a new folder to organize files or projects.                            |
| `rmdir emptydir`        | Removes an empty directory.                                                             | When I want to delete a directory that no longer contains files or subdirectories. |
| `rm -rf backup_project` | Recursively and forcefully removes the `backup_project` directory and all its contents. | When I need to permanently delete a directory tree without confirmation prompts.   |
| `ls -R`                 | Lists the contents of the current directory and all subdirectories recursively.         | When I want to view the complete directory structure from my current location.     |




### Group 4 – Finding and Identifying Files


<img width="1280" height="800" alt="4" src="https://github.com/user-attachments/assets/7f5b020c-53a7-451f-beb7-85cb8db3077f" />


| Command                | What it does                                                                        | When I use it                                                   |
| ---------------------- | ----------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `find . -name '*.txt'` | Searches the current directory and its subdirectories for files ending with `.txt`. | When I need to locate text files within a directory tree.       |
| `find . -mtime -3`     | Finds files modified within the last 3 days.                                        | When I want to identify recently changed files.                 |
| `find . -type f`       | Searches for regular files only, excluding directories and other file types.        | When I need a list of files without directory entries.          |
| `locate report.txt`    | Quickly searches the system database for a file named `report.txt`.                 | When I know the filename and want to find its location rapidly. |
| `file /bin/bash`       | Displays the file type and information about `/bin/bash`.                           | When I need to identify the type or format of a file.           |





### Group 5 – File Information, Links, and Path Utilities


<img width="1280" height="800" alt="5" src="https://github.com/user-attachments/assets/f5f91b0c-7362-44d2-ad37-5761c7ee755e" />



| Command                                  | What it does                                                                                        | When I use it                                                        |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| `stat /etc/hostname`                     | Displays detailed information about a file, including size, permissions, ownership, and timestamps. | When I need complete metadata about a file.                          |
| `which python3`                          | Shows the location of the `python3` executable in the system PATH.                                  | When I want to know which executable will run when I type a command. |
| `ln -s /etc/hosts mylink`                | Creates a symbolic (soft) link named `mylink` pointing to `/etc/hosts`.                             | When I want convenient access to a file without duplicating it.      |
| `ls -l mylink`                           | Displays detailed information about the symbolic link and its target.                               | When I need to verify where a symbolic link points.                  |
| `tree /etc -L 2`                         | Displays the directory structure of `/etc` up to 2 levels deep.                                     | When I want a visual overview of a directory hierarchy.              |
| `basename /home/user/project/report.txt` | Extracts the filename from a path.                                                                  | When I need only the file name without the directory path.           |
| `dirname /home/user/project/report.txt`  | Extracts the directory portion of a path.                                                           | When I need only the parent directory path.                          |
















