# Day-1 Navigation, Files and Directories

## RHCSA Linux on Oracle VirtualBox | 5 June 2026

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

















