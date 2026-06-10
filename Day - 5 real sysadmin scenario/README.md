
## Group - 1 Command Chaining, Environment & Monitoring Commands


<img width="1280" height="800" alt="5 1" src="https://github.com/user-attachments/assets/2f2cc7da-9fd4-4354-bc12-8cd2470005c5" />


| Command                      | What It Does                                                   | When to Use It                                                 |
| ---------------------------- | -------------------------------------------------------------- | -------------------------------------------------------------- |
| `find + grep + awk` Pipeline | Combines multiple commands to search, filter, and process data | Log analysis, file searching, report generation                |
| `echo $?`                    | Displays the exit status of the previously executed command    | Checking whether a command succeeded or failed                 |
| `;` (Semicolon)              | Executes multiple commands sequentially on one line            | Running several commands without waiting for each one manually |
| `alias ll='ls -la'`          | Creates a shortcut command                                     | Frequently used long commands                                  |
| `env`                        | Displays all environment variables                             | Viewing system configuration and user environment              |
| `command --help`             | Shows built-in help for a command                              | Learning command syntax and options                            |
| `watch -n 2 'df -h'`         | Re-runs a command every 2 seconds and updates the screen       | Real-time monitoring of system resources                       |





## Group - 2 Linux Monitoring, Automation & Shell Productivity Commands




<img width="1280" height="800" alt="5 2" src="https://github.com/user-attachments/assets/4a2bf0b9-65b9-4b40-b49f-dd519c422f23" />




| Command                            | What It Does                                                            | When to Use It                                                |
| ---------------------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------- |
| `watch -n 2 'df -h'`               | Repeatedly runs a command every 2 seconds and refreshes the output      | Monitor disk space, memory, or running processes in real time |
| `xargs`                            | Converts standard input into command-line arguments for another command | Process multiple files or outputs efficiently                 |
| `&&` (AND Operator)                | Executes the next command only if the previous command succeeds         | Chain commands safely during administration tasks             |
| `history`                          | Displays previously executed commands                                   | Review, repeat, or audit command history                      |
| `export PATH=$PATH:/usr/local/bin` | Adds a directory to the shell's executable search path                  | Make custom programs executable from anywhere                 |







## Group - 3 Linux User Environment, Shell Utilities & Command Control Operators


<img width="1280" height="800" alt="5 3" src="https://github.com/user-attachments/assets/b9c1dd6e-1e31-48e0-80ad-49bea94df8a2" />





| Command                  | What It Does                                                                          | Example Output                                     | When I Use It                                                                       |
| ------------------------ | ------------------------------------------------------------------------------------- | -------------------------------------------------- | ----------------------------------------------------------------------------------- |
| `echo $HOME`             | Displays the current user's home directory stored in the `HOME` environment variable. | `/home/devanshi`                                   | When I need to know where my personal files and configuration files are stored.     |
| `echo $USER`             | Displays the username of the currently logged-in user.                                | `devanshi`                                         | When writing scripts or verifying which user account is active.                     |
| `echo $SHELL`            | Displays the default shell being used by the current user.                            | `/bin/bash`                                        | When checking whether I'm using Bash, Zsh, or another shell.                        |
| `type command`           | Shows how the shell interprets a command (built-in, alias, function, or executable).  | `type ls` → `ls is aliased to 'ls --color=auto'`   | When troubleshooting commands or checking whether a command is an alias.            |
| `script session.log`     | Records everything typed and displayed in the terminal into a log file.               | `Script started, file is session.log`              | When creating proof of work, lab reports, or keeping a record of terminal activity. |
| `tee -a file`            | Displays output on the screen and simultaneously appends it to a file.                | Output appears on screen and is saved to the file. | When I want to view command output while also saving it for later analysis.         |
| `command1 \|\| command2` | Executes the second command only if the first command fails.                          | `mkdir test \|\| echo "Failed"`                    | When I want an alternative action if a command encounters an error.                 |






