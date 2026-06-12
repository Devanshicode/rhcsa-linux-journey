
# Thinking Questions and Practical Insights

### 1. SIGTERM vs SIGKILL — why does SIGTERM exist if -9 always works? What happens to open database connections with -9?

Ans: "At first I thought SIGTERM was unnecessary because SIGKILL (-9) always works. Then I learned that SIGTERM and SIGKILL have completely different purposes. SIGTERM politely asks a process to stop, giving it time to save data, close files, release resources, and shut down cleanly. SIGKILL does not ask anything — the kernel immediately removes the process from memory.

The surprising part was understanding what happens to databases. If a database process receives SIGKILL, any open transactions or connections may be interrupted instantly. Modern databases usually recover using logs, but there is still a risk of unfinished work or temporary inconsistency. This is why administrators always try SIGTERM first and only use SIGKILL when a process becomes unresponsive. In production environments, force-killing services without checking consequences can cause downtime and data recovery work."


### 2. nice affects CPU scheduling but not I/O. A backup script hogs disk I/O even with nice -n 19. What tool would you use for I/O prioritization?

Ans: "I initially assumed that setting a very high nice value would make a process use fewer system resources overall. Then I discovered that nice only affects CPU scheduling, not disk operations. A backup job can still heavily use the disk even when its CPU priority is very low.

The tool designed for this situation is ionice. While nice controls CPU priority, ionice controls disk I/O priority. That means I can allow important applications to access storage first while backup jobs run in the background with lower priority. This is very common on Linux servers because backups, log processing, and large file transfers can slow down production workloads if disk access is not managed properly."


### 3. nohup vs screen vs tmux — all keep processes running after logout. What is the practical difference between them?

Ans: "At first all three tools looked identical to me because they keep processes running after logout. The difference became clear when I understood how they are actually used.

nohup is the simplest option. It just prevents a process from stopping when I log out, but I cannot reconnect to the same interactive session later. screen and tmux are different because they create persistent terminal sessions. I can disconnect, log out, reconnect later, and continue working exactly where I left off.

The most surprising part was realizing that cloud engineers often use tmux during long server maintenance tasks. If their internet connection drops while connected to an AWS EC2 instance, the session keeps running on the server. After reconnecting, they simply reattach to the tmux session and continue working without losing progress."


### 4. In AWS, what happens to processes when an EC2 instance terminates? How does this affect stateful applications?

Ans: "When I first learned about EC2 termination, I assumed AWS would somehow save running processes and restore them later. Then I realized that terminating an EC2 instance is like completely destroying that virtual machine. All running processes immediately stop because the operating system itself no longer exists.

What surprised me was how this affects stateful applications. If an application stores important information only in memory or on temporary instance storage, that data disappears when the instance is terminated. This is why production systems store important data in services such as EBS volumes, databases, or shared storage. In real cloud environments, engineers design applications assuming servers can disappear at any time, so critical state must live outside the instance."




















