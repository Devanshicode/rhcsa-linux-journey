
# Group - 1 Process Management & Job Control Commands



<img width="1280" height="800" alt="6 1" src="https://github.com/user-attachments/assets/c053f2fd-9841-42c3-8908-6584b8788edf" />






<img width="1280" height="800" alt="6 1 1" src="https://github.com/user-attachments/assets/fd562e1b-f1a9-4c6c-8e87-a7664328ffcb" />








| Command          | What It Does                                         | When to Use It                                                              |
| ---------------- | ---------------------------------------------------- | --------------------------------------------------------------------------- |
| `ps aux`         | Displays all running processes on the system         | When you want to see what programs and services are currently running       |
| `htop`           | Interactive process viewer with CPU and memory usage | When monitoring system performance in real time                             |
| `kill 1234`      | Sends a termination signal to process ID (PID) 1234  | When a process is frozen or needs to be stopped                             |
| `kill -l`        | Lists all available Linux signals                    | When you want to know which signals can be sent to processes                |
| `nice -n 10 cmd` | Starts a command with lower CPU priority             | When running long tasks without affecting other users                       |
| `bg %1`          | Resumes Job 1 in the background                      | When a paused process should continue running without blocking the terminal |




## Group - 2 Linux Process Monitoring and Process Management Commands






<img width="1280" height="800" alt="6 2" src="https://github.com/user-attachments/assets/5802b82c-ffa3-40d8-8dff-892e4c1fd796" />










| Command          | What It Does                                                                   | When to Use It                                                                     |
| ---------------- | ------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- |
| `lsof -p 1234`   | Lists all files, network connections, and resources opened by process ID 1234. | When you want to know what files or ports a process is currently using.            |
| `strace -p 1234` | Attaches to a running process and shows its system calls in real time.         | When troubleshooting why a process is hanging, crashing, or behaving unexpectedly. |
| `ps -ef`         | Displays all running processes in full format.                                 | When you need a complete view of system activity.                                  |
| `pgrep nginx`    | Finds the PID(s) of processes matching the name nginx.                         | When you know the process name but not its PID.                                    |
| `kill -9 1234`   | Forcefully terminates process ID 1234.                                         | When a process refuses to stop normally.                                           |
| `pkill httpd`    | Terminates processes by name instead of PID.                                   | When you want to stop all instances of a service quickly.                          |





## Group - 3 Process Management & System Monitoring Commands




 
<img width="1280" height="800" alt="6 3" src="https://github.com/user-attachments/assets/19e24841-fcb7-4fcb-bd27-5949cd3b0b2e" />









| Command          | What It Does                                                         | When You Use It                                                                   |
| ---------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| `renice -5 1234` | Changes the priority (nice value) of a running process with PID 1234 | When a process needs more CPU time or less CPU time                               |
| `fg %1`          | Brings background job number 1 to the foreground                     | When you want to interact with a job that was running in the background           |
| `lsof -i :80`    | Lists processes using TCP/UDP port 80                                | When a web server port is busy and you need to identify which process is using it |
| `top`            | Displays real-time system and process information                    | When monitoring CPU, RAM, and running processes                                   |
| `pstree`         | Shows processes in a tree hierarchy                                  | When understanding parent-child process relationships                             |







# Group - 4 : Process Management and Background Job Control in Linux





<img width="1280" height="800" alt="6 4" src="https://github.com/user-attachments/assets/0462724a-0ad9-4403-b008-8f7898b00a1f" />








| Command             | What It Does                                                      | When to Use It                                          |
| ------------------- | ----------------------------------------------------------------- | ------------------------------------------------------- |
| `kill -HUP 1234`    | Sends the HUP (Hang Up) signal to process ID 1234                 | Reload configuration without fully restarting a service |
| `killall nginx`     | Terminates all processes named nginx                              | Stop all running instances of a program                 |
| `jobs`              | Displays background jobs started from the current terminal        | Check what is running in the background                 |
| `nohup script.sh &` | Runs a script in the background and keeps it running after logout | Long-running tasks on servers                           |
| `/proc/PID/`        | Virtual directory containing information about a process          | Investigating process details and troubleshooting       |









