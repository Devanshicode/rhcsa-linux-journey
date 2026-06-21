
# Group - 1 Podman Containers






| Command                                             | What It Does                                        | When I Use It                  |
| --------------------------------------------------- | --------------------------------------------------- | ------------------------------ |
| `podman --version`                                  | Shows installed Podman version                      | Verify installation            |
| `podman run -d -p 8080:80 docker.io/library/nginx`  | Runs nginx container in background and maps ports   | Deploy web applications        |
| `podman stop CONTAINER_ID`                          | Stops running container                             | Maintenance or troubleshooting |
| `podman start CONTAINER_ID`                         | Starts stopped container                            | Reuse existing container       |
| `podman rm CONTAINER_ID`                            | Removes container permanently                       | Cleanup unused containers      |
| `podman run -v myvol:/data docker.io/library/nginx` | Attaches persistent volume to container             | Store data permanently         |
| `free -h`                                           | Displays RAM and swap usage                         | Memory monitoring              |
| `sar -u 1 5`                                        | Displays CPU utilization every second for 5 samples | Performance monitoring         |





# Group - 2 Container Management, Network Statistics










| Command                   | What It Does                                                           | When I Use It                               |
| ------------------------- | ---------------------------------------------------------------------- | ------------------------------------------- |
| `netstat -s`              | Shows protocol statistics for TCP, UDP, ICMP and IP                    | Network troubleshooting and packet analysis |
| `podman pull nginx`       | Downloads nginx container image                                        | Before creating nginx containers            |
| `podman ps`               | Lists running containers                                               | Verify container status                     |
| `podman logs webserver`   | Displays container logs                                                | Debugging container issues                  |
| `podman build -t myapp .` | Builds custom image from Containerfile                                 | Packaging and deploying applications        |
| `vmstat 1 5`              | Monitors CPU, memory and system performance every second for 5 reports | Performance monitoring and troubleshooting  |





# Group - 3 Linux Diagnostics, Network Analysis










| Command                          | What It Does                                  | When I Use It                             |
| -------------------------------- | --------------------------------------------- | ----------------------------------------- |
| `dmesg \| tail -20`              | Shows last 20 kernel/system messages          | Hardware, boot, USB, disk troubleshooting |
| `tcpdump -i eth0 port 80`        | Captures HTTP network traffic on an interface | Network debugging and packet analysis     |
| `podman images`                  | Lists downloaded container images             | Managing container images                 |
| `podman exec -it webserver bash` | Opens Bash shell inside running container     | Container debugging and administration    |





# Group - 4 Podman Storage, System Monitoring & Network Monitoring Commands









| Command                                  | What It Does                                    | When I Use It                                    |
| ---------------------------------------- | ----------------------------------------------- | ------------------------------------------------ |
| `podman volume create myvol`             | Creates a persistent Podman storage volume      | Store container data permanently                 |
| `podman generate systemd --name mynginx` | Generates systemd service file for a container  | Auto-start containers and manage with systemctl  |
| `iostat -x 1`                            | Shows detailed disk I/O statistics every second | Analyze storage performance and disk bottlenecks |
| `uptime`                                 | Displays uptime, users, and load average        | Quick system health check                        |
| `w`                                      | Shows logged-in users and their activities      | User monitoring and security checks              |
| `iftop`                                  | Displays real-time network bandwidth usage      | Network troubleshooting and traffic monitoring   |


