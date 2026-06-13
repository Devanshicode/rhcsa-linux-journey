
## Group - 1 NGINX Service Control Commands



<img width="1280" height="800" alt="7 1 1" src="https://github.com/user-attachments/assets/1548453e-466c-4777-b1f7-28ee886f394d" />


<img width="1280" height="800" alt="7 1" src="https://github.com/user-attachments/assets/d155463f-d10e-4a12-bc6e-561f4d451f03" />






| Command                               | What it does                                         | When you use it                                            |
| ------------------------------------- | ---------------------------------------------------- | ---------------------------------------------------------- |
| `systemctl start nginx`               | Starts the Nginx service immediately                 | When you want to run Nginx right now                       |
| `systemctl reload nginx`              | Reloads Nginx configuration without stopping service | When you change config files and don’t want downtime       |
| `systemctl enable --now nginx`        | Starts Nginx immediately AND enables it on boot      | When you want Nginx to start automatically after reboot    |
| `systemctl list-units --type=service` | Shows all active services running on system          | When you want to check what services are currently running |
| `systemctl daemon-reload`             | Reloads systemd manager configuration                | When you change service files or system configs            |






## Group - 2 Service & System Management Commands













| Command                           | What it does                                                                    | When I use it                                                    |
| --------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| `journalctl --since "1 hour ago"` | Shows system logs from last 1 hour                                              | When I want to check recent errors, crashes, or service activity |
| `systemctl isolate rescue.target` | Switch system to rescue mode (minimal environment, only essential services run) | When system has serious issues and I need troubleshooting mode   |
| `systemctl stop nginx`            | Stops nginx service immediately                                                 | When I want to temporarily stop a web server or service          |
| `systemctl enable nginx`          | Makes nginx start automatically on boot                                         | When I want service to run every time system starts              |
| `systemctl status nginx`          | Shows current status of nginx (running/stopped/error + logs)                    | When I want to check if service is working properly              |




## Group - 3 Systemd & Nginx Service Debugging Commands




<img width="1280" height="800" alt="7 3 1" src="https://github.com/user-attachments/assets/469b350b-5cb7-427b-97fd-8fbfd5dee68d" />




<img width="1280" height="800" alt="7 3 2" src="https://github.com/user-attachments/assets/0ee3418a-33e1-434f-b45c-3287eea59a40" />








| Command                             | What it does                                                                                                                                      | When I use it                                                              |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| `systemctl cat nginx`               | Shows the full **nginx service file** (unit configuration). It displays how nginx service is defined in systemd (paths, start command, settings). | When I want to understand **how nginx service is configured internally**   |
| `journalctl -u nginx`               | Shows **all logs of nginx service** (startup, errors, warnings, shutdown).                                                                        | When nginx is not working and I want to see **what happened step by step** |
| `journalctl -p err`                 | Shows only **error-level system logs** from the system.                                                                                           | When I want to quickly find **only errors in system (not full logs)**      |
| `systemctl list-dependencies nginx` | Shows all **services that nginx depends on** (like network, filesystem, etc.).                                                                    | When I want to understand **what nginx needs to run properly**             |
| `systemctl restart nginx`           | Stops nginx and starts it again (refreshes service).                                                                                              | When nginx changes are made or it is **not responding / stuck**            |




## Group - 4 Systemd Service Management & Logs Monitoring




<img width="1280" height="800" alt="7 4" src="https://github.com/user-attachments/assets/4acc4540-74be-4a20-b21c-347d30c4c8ea" />









| Command                       | What it does                                            | When I use it                                        |
| ----------------------------- | ------------------------------------------------------- | ---------------------------------------------------- |
| `systemctl disable nginx`     | Stops nginx from starting automatically on boot         | When I don’t want nginx to start after reboot        |
| `systemctl is-active nginx`   | Checks whether nginx is currently running or not        | When I want to quickly verify service status         |
| `systemctl edit nginx --full` | Opens full service file to edit nginx configuration     | When I need to change how nginx service behaves      |
| `journalctl -f`               | Shows real-time live logs of system/services            | When I am debugging errors or watching live activity |
| `systemctl get-default`       | Shows default boot target (GUI or CLI mode)             | When I want to check system startup mode             |
| `Unit file [Service] options` | Shows configuration options inside systemd service file | When I am learning or editing service behavior       |












