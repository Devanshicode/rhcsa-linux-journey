
# Thinking Questions – Linux & AWS

## 1. SIGTERM vs SIGKILL — why does SIGTERM exist if -9 always works? What happens to open database connections with -9?

When I first learned about `kill -9`, I thought it made every other signal unnecessary because it can forcefully stop any process. Then I understood why `SIGTERM` exists. `SIGTERM` is like politely asking a process to shut down. It gives the application a chance to save data, close files, release memory, and clean up resources before exiting. `SIGKILL` (`kill -9`) does not give the process any chance to respond — the kernel immediately removes it.

The real danger appears with databases. If a database process receives `SIGTERM`, it can finish ongoing transactions, close client connections, and write pending data to disk. If it receives `SIGKILL`, it is stopped instantly. Open database connections are dropped, unfinished transactions may be rolled back during recovery, and the database may need additional startup checks when restarted. This is why system administrators usually try `SIGTERM` first and only use `SIGKILL` when a process is completely unresponsive.

---

## 2. nice affects CPU scheduling but not I/O. A backup script hogs disk I/O even with nice -n 19. What tool would you use for I/O prioritization?

When I first learned about the `nice` command, I assumed it controlled how much of every system resource a process could use. Then I discovered that `nice` only affects CPU scheduling. A process with a low CPU priority can still read and write huge amounts of data from disk.

Imagine a backup script running with `nice -n 19`. Its CPU usage is low, but it is still constantly reading and writing files. Other applications become slow because the disk is busy, not the CPU. In this situation, the correct tool is `ionice`, which controls disk I/O priority. By running a backup with `ionice`, the operating system can give more important applications higher access to disk resources while the backup runs in the background. In production servers, administrators often combine `nice` and `ionice` together to control both CPU and disk usage.

---

## 3. nohup vs screen vs tmux — all keep processes running after logout. What is the practical difference between them?

When I first saw `nohup`, `screen`, and `tmux`, they looked like different commands solving the same problem. Then I realized they work at different levels.

`nohup` is the simplest option. It tells a process to ignore the logout signal so it keeps running after the user disconnects. However, once started, there is no interactive session to reconnect to.

`screen` and `tmux` create a persistent terminal session. If the network disconnects or the user logs out, the session continues running. Later, the user can reconnect and continue exactly where they left off. The major advantage is that all terminal output, running commands, and shells remain available.

A real-world example is running a long software installation on a remote server. With `nohup`, the installation continues after logout, but monitoring it is difficult. With `tmux` or `screen`, you can disconnect, reconnect hours later, and see the exact progress. This is why many Linux administrators prefer `tmux` for daily server management.

---

## 4. In AWS, what happens to processes when an EC2 instance terminates? How does this affect stateful applications?

When I first started learning AWS, I assumed terminating an EC2 instance was similar to logging out of a Linux server. Then I understood that termination means the entire virtual machine is destroyed.

When an EC2 instance terminates, all running processes stop immediately because the operating system itself no longer exists. Any data stored only in memory is lost. Depending on the storage configuration, local instance storage may also disappear permanently.

This becomes very important for stateful applications such as databases. A database stores important state — user records, transactions, and application data. If the database is running on an EC2 instance without persistent storage, terminating the instance can result in data loss. This is why production AWS environments usually separate compute from storage by using persistent services such as EBS volumes, snapshots, or managed database services. The lesson is that servers can be temporary, but critical data must be stored somewhere that survives instance termination.
