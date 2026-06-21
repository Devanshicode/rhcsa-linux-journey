
# Group - 1 Podman Containers



<img width="1280" height="800" alt="14 1" src="https://github.com/user-attachments/assets/fcda6659-3268-4348-96fb-9361e268ca03" />



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




<img width="1280" height="800" alt="14 2 1" src="https://github.com/user-attachments/assets/170e031d-e514-484f-932a-7fba7beafdd2" />




<img width="1280" height="800" alt="14 2" src="https://github.com/user-attachments/assets/2f781f5b-e822-4bd0-a589-7c0d6af8bce6" />





| Command                   | What It Does                                                           | When I Use It                               |
| ------------------------- | ---------------------------------------------------------------------- | ------------------------------------------- |
| `netstat -s`              | Shows protocol statistics for TCP, UDP, ICMP and IP                    | Network troubleshooting and packet analysis |
| `podman pull nginx`       | Downloads nginx container image                                        | Before creating nginx containers            |
| `podman ps`               | Lists running containers                                               | Verify container status                     |
| `podman logs webserver`   | Displays container logs                                                | Debugging container issues                  |
| `podman build -t myapp .` | Builds custom image from Containerfile                                 | Packaging and deploying applications        |
| `vmstat 1 5`              | Monitors CPU, memory and system performance every second for 5 reports | Performance monitoring and troubleshooting  |





# Group - 3 Linux Diagnostics, Network Analysis





<img width="1280" height="800" alt="14 3" src="https://github.com/user-attachments/assets/0ab9266d-38f5-444b-9652-e38fc43a2bba" />






| Command                          | What It Does                                  | When I Use It                             |
| -------------------------------- | --------------------------------------------- | ----------------------------------------- |
| `dmesg \| tail -20`              | Shows last 20 kernel/system messages          | Hardware, boot, USB, disk troubleshooting |
| `tcpdump -i eth0 port 80`        | Captures HTTP network traffic on an interface | Network debugging and packet analysis     |
| `podman images`                  | Lists downloaded container images             | Managing container images                 |
| `podman exec -it webserver bash` | Opens Bash shell inside running container     | Container debugging and administration    |





# Group - 4 Podman Storage, System Monitoring & Network Monitoring Commands



<img width="1280" height="800" alt="14 4 1" src="https://github.com/user-attachments/assets/0d4e1973-cf61-4185-b2e8-dd41fd9879fc" />



<img width="1280" height="800" alt="14 4" src="https://github.com/user-attachments/assets/d385ae41-009a-4c8f-87f6-e678e227730f" />





| Command                                  | What It Does                                    | When I Use It                                    |
| ---------------------------------------- | ----------------------------------------------- | ------------------------------------------------ |
| `podman volume create myvol`             | Creates a persistent Podman storage volume      | Store container data permanently                 |
| `podman generate systemd --name mynginx` | Generates systemd service file for a container  | Auto-start containers and manage with systemctl  |
| `iostat -x 1`                            | Shows detailed disk I/O statistics every second | Analyze storage performance and disk bottlenecks |
| `uptime`                                 | Displays uptime, users, and load average        | Quick system health check                        |
| `w`                                      | Shows logged-in users and their activities      | User monitoring and security checks              |
| `iftop`                                  | Displays real-time network bandwidth usage      | Network troubleshooting and traffic monitoring   |


