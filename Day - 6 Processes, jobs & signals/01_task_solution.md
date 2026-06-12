
Task : 6 Process Management, Signals, Open Files, and System Call Tracing


<img width="1280" height="800" alt="task 6 1" src="https://github.com/user-attachments/assets/2916b36f-6f4d-444d-ac37-99e66d23700d" />



<img width="1280" height="800" alt="task 6 2" src="https://github.com/user-attachments/assets/3e6d99ab-794d-4ca4-887f-1b0b4b02c62d" />




 ## Objective
 Start 3 background sleep processes with different priorities (nice levels 0, 5, 15). Identify them with pstree and ps. Send SIGHUP to one (simulate reload). Kill one with SIGTERM, one with SIGKILL. Use lsof to find what files nginx has open. Use strace to see what system calls a simple ls makes.




## Step 1: Start Background Processes with Different Nice Values

### Command 

```bash
sleep 300 &
```


```bash
nice -n 5 sleep 300 &
```


```bash
nice -n 15 sleep 300 &
```

### What These Commands Do

#### sleep

Makes a process do nothing for a specified number of seconds.

```bash
sleep 300
```

* sleep = command
* 300 = seconds

The process remains running for 5 minutes.

#### &

Runs the process in the background.

Example:

```bash
sleep 300 &
```

The terminal becomes available immediately while the process continues running.

#### nice -n 5

```bash
nice -n 5 sleep 300
```

Breakdown:

* nice = start a process with modified priority
* -n = specify nice value
* 5 = priority adjustment
* sleep 300 = command to run

#### Nice Values

| Nice Value | Priority            |
| ---------- | ------------------- |
| 0          | Normal              |
| 5          | Lower Priority      |
| 15         | Much Lower Priority |

Higher nice number = lower CPU priority.

---

## Step 2: Identify Processes Using ps

```bash
ps -eo pid,ni,cmd | grep sleep
```

### Breakdown

#### ps

Displays running processes.

#### -e

Show every process.

#### -o

Custom output format.

Fields:

* pid = Process ID
* ni = Nice value
* cmd = Command

#### grep sleep

Displays only sleep processes.

Expected output:

```text
1234  0  sleep 300
1235  5  sleep 300
1236 15  sleep 300
```

---

## Step 3: View Process Tree

```bash
pstree -p
```

### Breakdown

#### pstree

Displays processes in tree format.

#### -p

Shows PID numbers.

Example:

```text
bash(1200)
 ├─sleep(1234)
 ├─sleep(1235)
 └─sleep(1236)
```

This shows parent-child relationships.

---

## Step 4: Send SIGHUP Signal

First find a PID:

```bash
ps -eo pid,ni,cmd | grep sleep
```

Suppose PID is 1234.

Send SIGHUP:

```bash
kill -HUP 1234
```

### Breakdown

#### kill

Sends signals to processes.

#### -HUP

SIGHUP signal.

Purpose:

* Historically used when a terminal disconnected.
* Modern services often reload configuration when receiving SIGHUP.

For a sleep process, it will usually terminate.

---

## Step 5: Terminate a Process Gracefully

Choose another PID.

```bash
kill -TERM 1235
```

### Breakdown

#### -TERM

SIGTERM signal.

Purpose:

* Politely asks a process to stop.
* Allows cleanup before exiting.

This is the preferred way to stop a process.

---

## Step 6: Forcefully Kill a Process

Choose remaining PID.

```bash
kill -KILL 1236
```

or

```bash
kill -9 1236
```

### Breakdown

#### -KILL

SIGKILL signal.

Purpose:

* Immediately stops the process.
* Process cannot ignore it.
* No cleanup occurs.

Use only when SIGTERM does not work.

---

## Step 7: Install Nginx (If Not Installed)

```bash
sudo apt update
sudo apt install nginx -y
```

Start service:

```bash
sudo systemctl start nginx
```

Verify:

```bash
systemctl status nginx
```

---

## Step 8: Find Files Opened by Nginx

```bash
sudo lsof -c nginx
```

### Breakdown

#### lsof

List Open Files.

Linux treats many resources as files.

#### -c nginx

Show only processes whose command name starts with nginx.

Possible output:

```text
nginx 1234 root cwd
nginx 1234 root /etc/nginx/nginx.conf
nginx 1234 root /var/log/nginx/access.log
```

This shows configuration files, logs, sockets and other resources used by nginx.

---

## Step 9: Trace System Calls of ls

```bash
strace ls
```

### Breakdown

#### strace

System Call Trace.

Shows how a program interacts with the Linux kernel.

#### ls

Command being monitored.

Example output:

```text
openat(...)
read(...)
write(...)
close(...)
```

---

## Step 10: Save strace Output to a File

```bash
strace -o trace.log ls
```

### Breakdown

#### -o trace.log

Save trace output into trace.log.

View it:

```bash
head trace.log
```






## Key Insights I Learned




At first I thought process priority was something Linux handled automatically and users rarely touched it. But when I launched three sleep processes using different nice values , I realized Linux actually lets us influence which processes should get CPU attention first.


The biggest surprise was learning that kill does not always "kill" a process. I assumed kill and terminate were the same thing. After using SIGHUP, SIGTERM and SIGKILL, I understood that signals are actually different instructions. 

One thing that confused me initially was why some administrators prefer SIGTERM over SIGKILL. After reading the behavior and testing it, I realized that SIGTERM allows applications to save data and close files properly. SIGKILL should be the last option when a process becomes unresponsive.

Using lsof was another eye-opener. I always thought files and network connections were separate things, but Linux treats almost everything as a file. Running lsof on nginx showed configuration files, logs and sockets all connected to the same process.


This connects directly to real cloud , System administrators and cloud engineers use these exact techniques when troubleshooting production servers. If a web server consumes too much CPU, hangs unexpectedly, refuses to stop, or keeps a file locked, tools like ps, pstree, kill, lsof and strace help identify the root cause quickly. These are the same troubleshooting skills used on Linux servers running in AWS, Azure and enterprise data centers.















