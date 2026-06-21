
# Group - 1 Linux Process Control







| Command              | What it does                             | When you use it                                            |
| -------------------- | ---------------------------------------- | ---------------------------------------------------------- |
| `ps aux`             | Shows all running processes with details | When you want to inspect system activity or find a process |
| `htop`               | Interactive real-time system monitor     | When you need live CPU/RAM monitoring and process control  |
| `kill 1234`          | Terminates a process using its PID       | When an application is frozen or needs to be stopped       |
| `kill -l`            | Lists all available kill signals         | When you need to choose or understand process signals      |
| `nice -n 10 command` | Runs a command with lower CPU priority   | When running heavy tasks without slowing system            |
| `bg %1`              | Moves a stopped job to background        | When you paused a job and want it to continue running      |






# Group - 2 Linux Process Inspection





| Command          | What it does                                   | When I use it                                                |
| ---------------- | ---------------------------------------------- | ------------------------------------------------------------ |
| `ps -ef`         | Shows all running processes in detailed format | When I want a full overview of what is running on the system |
| `pgrep nginx`    | Finds PID of a process by name                 | When I know the process name but not the PID                 |
| `lsof -p 1234`   | Shows all files opened by a process            | When debugging file usage, ports, or resource leaks          |
| `strace -p 1234` | Traces system calls of a process in real time  | When I need deep debugging of crashes or unexpected behavior |
| `kill -9 1234`   | Forcefully stops a process immediately         | When a process is stuck or not responding                    |




# Group - 3 Network Inspection Toolkit









| Command          | What it does                                    | When I use it                                  |
| ---------------- | ----------------------------------------------- | ---------------------------------------------- |
| `pkill httpd`    | Stops all processes named httpd                 | When web server needs restart or is stuck      |
| `renice -5 1234` | Changes process priority to higher CPU priority | When a process needs faster execution          |
| `fg %1`          | Brings background job to foreground             | When resuming paused or background tasks       |
| `lsof -i :80`    | Shows process using port 80                     | When debugging port conflicts or server issues |
| `top`            | Displays real-time system performance           | When monitoring CPU/memory usage or system lag |






# Group - 4 Process Inspection, Job Control & Service Management 










| Command             | What it does                                                             | When I use it                                                                     |
| ------------------- | ------------------------------------------------------------------------ | --------------------------------------------------------------------------------- |
| `pstree`            | Shows all running processes in a parent-child tree structure             | When I want to understand system process hierarchy or debug service relationships |
| `kill -HUP 1234`    | Sends a reload signal to a specific process ID without fully stopping it | When I need a service to re-read configuration safely                             |
| `killall nginx`     | Stops every running process with the name nginx                          | When I want to quickly shut down a whole service completely                       |
| `jobs`              | Displays all background and suspended tasks in current shell session     | When I forget what I ran in background and want to manage them                    |
| `nohup script.sh &` | Runs a script that keeps executing even after terminal is closed         | When I need long-running tasks like backups or servers to continue after logout   |
| `/proc/PID/`        | Virtual directory showing real-time details of a running process         | When I want deep inspection of memory, status, or runtime behavior of a process   |




















