
# Group - 1 Text Processing, Command Control & Environment Handling




| Command             | What it does                                       | When I use it                                                                            |
| ------------------- | -------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| `find + grep + awk` | Chains file search, filtering, and text processing | When I need to search and extract specific files or text patterns from large directories |
| `echo $?`           | Shows exit status of last command                  | When I want to check if a command succeeded or failed                                    |
| `;`                 | Runs multiple commands sequentially in one line    | When I want to execute several commands without writing multiple lines                   |
| `alias ll='ls -la'` | Creates shortcut for long commands                 | When I frequently use repetitive commands and want faster execution                      |
| `env`               | Displays system environment variables              | When I need to debug system settings or check runtime environment                        |




# Group - 2 Linux Command Toolkit Essentials






| Command              | What it does                                                        | When you use it                                              |
| -------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------ |
| `--help`             | Shows manual/help for a command with options and usage              | When you forget syntax or want to explore a command          |
| `watch -n 2 'df -h'` | Runs a command repeatedly every 2 seconds and shows live disk usage | When monitoring system storage in real time                  |
| `xargs`              | Converts input from one command into arguments for another command  | When working with pipelines like find, grep, rm, etc.        |
| `&&`                 | Runs second command only if first command succeeds                  | When chaining safe dependent commands in scripts or terminal |
| `history`            | Shows list of previously executed commands                          | When you want to reuse or review past terminal commands      |






# Group - 3 Linux Environment Configuration & Session Logging Tools






| Command                            | What it does                                                    | When you use it                                                           |
| ---------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `export PATH=$PATH:/usr/local/bin` | Adds new directory to system PATH so executables are recognized | When installed programs are not found or adding custom scripts            |
| `echo $HOME $USER $SHELL`          | Displays user home directory, username, and default shell       | When checking environment details or debugging user settings              |
| `type command`                     | Shows whether a command is alias, builtin, or external program  | When debugging or understanding command behavior                          |
| `script session.log`               | Records entire terminal session into a log file                 | When you need session recording for audit, assignment, or troubleshooting |
| `tee -a file`                      | Sends output to both screen and file (append mode)              | When you want to log output while still viewing it in terminal            |






# Group - 4 Shell Productivity & Debugging







| Command            | What it does                                            | When you use it                                          |
| ------------------ | ------------------------------------------------------- | -------------------------------------------------------- |
| `\|\|`             | Runs second command only if first fails                 | When you want fallback execution in scripts              |
| `Ctrl + R`         | Searches previous terminal commands interactively       | When you want to quickly reuse old commands              |
| `source ~/.bashrc` | Reloads shell configuration without restarting terminal | After editing aliases, exports, or environment variables |
| `man <command>`    | Shows manual/help documentation for commands            | When you want to understand how a command works          |
| `time <command>`   | Measures execution time of a command                    | When you want to check performance or speed of scripts   |
| `cat session.log`  | Displays contents of a file in terminal                 | When you want to quickly view logs or file content       |
































