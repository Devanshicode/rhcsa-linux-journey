
Task - 6: Process Management, Signals, lsof and strace

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
