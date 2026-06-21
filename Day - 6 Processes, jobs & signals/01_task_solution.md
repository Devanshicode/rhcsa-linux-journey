
# Task - 6: Process Management, Signals, lsof and strace

Step 1: Start three background processes with different priorities
Command:
sleep 300 &
nice -n 5 sleep 300 &
nice -n 15 sleep 300 &

Explanation:
sleep 300 → Runs a process for 300 seconds.
& → Runs process in background.
nice -n 5 → Starts process with nice value 5.
nice -n 15 → Starts process with nice value 15.

Purpose:
Create processes with different CPU scheduling priorities.

--------------------------------------------------

Step 2: View background jobs
Command:
jobs -l

Explanation:
jobs → Lists shell background jobs.
-l → Displays PID of each job.

Purpose:
Identify process IDs.

--------------------------------------------------

Step 3: Verify nice levels
Command:
ps -eo pid,ni,cmd | grep sleep

Explanation:
ps → Shows running processes.
-e → Show all processes.
-o → Custom output.
pid → Process ID.
ni → Nice value.
cmd → Command name.
grep sleep → Filter sleep processes.

Purpose:
Verify nice levels 0, 5 and 15.

--------------------------------------------------

Step 4: View process tree
Command:
pstree -p

Explanation:
pstree → Displays process hierarchy.
-p → Show PIDs.

Purpose:
View parent-child process relationships.

--------------------------------------------------

Step 5: Send SIGHUP
Command:
kill -SIGHUP <PID>

Explanation:
kill → Sends signal.
-SIGHUP → Signal 1 (hangup/reload).

Purpose:
Simulate configuration reload signal.

--------------------------------------------------

Step 6: Verify process
Command:
ps -p <PID>

Explanation:
-p → Show specific PID.

Purpose:
Check process status.

--------------------------------------------------

Step 7: Gracefully terminate process
Command:
kill -SIGTERM <PID>

Explanation:
SIGTERM → Signal 15.

Purpose:
Request normal process termination.

--------------------------------------------------

Step 8: Verify termination
Command:
ps -p <PID>

Explanation:
Checks if process still exists.

Purpose:
Confirm graceful shutdown.

--------------------------------------------------

Step 9: Force kill process
Command:
kill -SIGKILL <PID>

Explanation:
SIGKILL → Signal 9.
Immediately terminates process.

Purpose:
Forcefully stop process.

--------------------------------------------------

Step 10: Verify force kill
Command:
ps -p <PID>

Explanation:
Checks if PID still exists.

Purpose:
Confirm process removal.

--------------------------------------------------

Step 11: Verify nginx service
Command:
sudo systemctl status nginx

Explanation:
systemctl → Service manager.
status → Show service state.
nginx → Web server service.

Purpose:
Ensure nginx is running.

--------------------------------------------------

Step 12: Install lsof
Command:
sudo dnf install lsof -y

Explanation:
dnf → Package manager.
install → Install package.
lsof → List open files.
-y → Automatic yes.

Purpose:
Install lsof utility.

--------------------------------------------------

Step 13: View nginx open files
Command:
sudo lsof -c nginx

Explanation:
lsof → Lists open files.
-c nginx → Filter nginx processes.

Purpose:
Display files, logs and sockets used by nginx.

--------------------------------------------------

Step 14: Install strace
Command:
sudo dnf install strace -y

Explanation:
strace → System call tracing utility.

Purpose:
Install tracing tool.

--------------------------------------------------

Step 15: Trace ls system calls
Command:
strace ls

Explanation:
strace → Monitor system calls.
ls → List directory contents.

Purpose:
Observe kernel interactions made by ls.

--------------------------------------------------

Step 16: Save trace output
Command:
strace -o ls_trace.txt ls

Explanation:
-o ls_trace.txt → Save output to file.

Purpose:
Store trace results.

--------------------------------------------------

Step 17: View saved trace
Command:
cat ls_trace.txt

Explanation:
cat → Display file contents.

Purpose:
Analyze captured system calls.




# Key Learning 

At first I thought changing the nice value would immediately show a huge difference between the sleep processes, but then I realized that sleep barely uses CPU, so the priority difference is mostly visible through commands like ps rather than actual performance. Using pstree helped me understand how processes are organized under the parent shell, while ps showed the PID, PPID, and NI (nice value) clearly. It made process management much easier to visualize compared to looking at raw process IDs alone.

When I started sending signals, I expected every signal to terminate the process. After testing, I learned that SIGHUP is traditionally used to tell a process to reload or re-read its configuration instead of killing it. SIGTERM politely asks a process to stop and gives it a chance to clean up resources, whereas SIGKILL immediately removes it from memory with no cleanup at all. Seeing the different behavior of these signals helped me understand why Linux administrators choose signals carefully instead of always using kill -9.

Using lsof with nginx was interesting because it revealed that a running service keeps many files open at the same time, including configuration files, log files, sockets, and libraries. Before this task I assumed a service only interacted with the file it was actively reading or writing. Looking at the open file list showed how much is happening behind the scenes whenever a web server is running.

The biggest learning came from strace. Running strace on a simple ls command showed dozens of system calls such as open, read, close, stat, and write. I always thought ls simply read a directory and printed the result, but strace exposed the actual conversation happening between the application and the Linux kernel. This is very similar to real cloud and MNC environments where engineers use strace to troubleshoot slow applications, identify missing files, debug permission problems, and understand why a service behaves differently on production servers compared to test systems.





















