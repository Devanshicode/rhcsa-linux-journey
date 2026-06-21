
# Group - 1 Systemd Service Management Operations




<img width="1280" height="800" alt="7 1 1" src="https://github.com/user-attachments/assets/633ea864-670d-42bf-a9e9-d9e8cdd8884f" />



<img width="1280" height="800" alt="7 1" src="https://github.com/user-attachments/assets/58213bfc-2b34-415c-99cc-92e7e3873abb" />



| Command                               | What it does                               | When I use it                                              |
| ------------------------------------- | ------------------------------------------ | ---------------------------------------------------------- |
| `systemctl start nginx`               | Starts Nginx service immediately           | When I need to manually start the web server               |
| `systemctl reload nginx`              | Reloads Nginx without stopping it          | When I update config files and want changes applied safely |
| `systemctl enable --now nginx`        | Starts Nginx now and enables it at boot    | When I want Nginx to always run automatically              |
| `systemctl list-units --type=service` | Lists all system services and their states | When I want to check running services or troubleshoot      |
| `systemctl daemon-reload`             | Reloads systemd configuration files        | When I edit or add new service unit files                  |






# Group - 2 System Debugging Commands




<img width="1280" height="800" alt="7 2" src="https://github.com/user-attachments/assets/d586e147-e636-4c18-98a8-160234a92c83" />







| Command                           | What it does                                                              | When I use it                                                                |
| --------------------------------- | ------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `journalctl --since "1 hour ago"` | Displays system logs from the last hour using systemd journal             | When a service failed recently and I need to trace the exact error timeline  |
| `systemctl isolate rescue.target` | Switches system into minimal rescue environment by stopping most services | When the system is unstable and I need deep recovery or maintenance access   |
| `systemctl stop nginx`            | Stops the nginx web server immediately                                    | When I need to temporarily shut down the web server for updates or debugging |
| `systemctl enable nginx`          | Enables nginx to start automatically during boot                          | When setting up a server so nginx always starts after reboot                 |
| `systemctl status nginx`          | Shows current state and logs of nginx service                             | When checking if nginx is running or diagnosing startup issues               |





# Group - 3 Nginx Service & Systemd Troubleshooting




<img width="1280" height="800" alt="7 3 1" src="https://github.com/user-attachments/assets/770e0231-a92c-4b30-88be-11b18fffd8c6" />





<img width="1280" height="800" alt="7 3 2" src="https://github.com/user-attachments/assets/a9467525-a355-4f3d-a34d-377dee0c066b" />






| Command                             | What it does                                                       | When you use it                                              |
| ----------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------ |
| `systemctl cat nginx`               | Displays full nginx service configuration file including overrides | When you want to inspect how nginx service is defined        |
| `journalctl -u nginx`               | Shows logs specifically related to nginx service                   | When nginx is failing, crashing, or behaving unexpectedly    |
| `journalctl -p err`                 | Displays system-wide error-level logs only                         | When debugging serious system errors affecting services      |
| `systemctl list-dependencies nginx` | Shows dependency tree of nginx service                             | When troubleshooting startup or service dependency issues    |
| `systemctl restart nginx`           | Restarts nginx service immediately                                 | When applying configuration changes or fixing service issues |
| `systemctl disable nginx`           | Disables nginx from starting on boot                               | When you want to stop auto-start behavior permanently        |










# Group - 4 Service Management & Debugging





<img width="1280" height="800" alt="7 4" src="https://github.com/user-attachments/assets/b0e01646-9ae1-4de3-a414-b4b43d6f5b0e" />






| Command                       | What it does                                        | When you use it                                                        |
| ----------------------------- | --------------------------------------------------- | ---------------------------------------------------------------------- |
| `systemctl is-active nginx`   | Checks if nginx service is running or not           | When you want to quickly verify service status                         |
| `systemctl edit nginx --full` | Opens full service configuration file for nginx     | When you need to modify service behavior or troubleshoot config issues |
| `journalctl -f`               | Shows live system logs in real-time                 | When debugging errors, crashes, or monitoring live service activity    |
| `systemctl get-default`       | Displays system boot mode (graphical or multi-user) | When checking or verifying system startup mode                         |





















