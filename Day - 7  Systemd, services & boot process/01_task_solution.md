
# Task 7: Install Nginx, Configure Auto-Restart, Create Custom Systemd Service

## Objective

1. Install Nginx.
2. Kill Nginx using SIGKILL (-9).
3. Configure automatic restart using systemd.
4. Test auto-restart functionality.
5. Create a custom systemd service for a Bash health logger script.
6. Enable and start the custom service.
7. Monitor logs using journalctl.
8. Understand each line of the systemd unit file.

---

## Step 1: Install Nginx

### Command

```bash
sudo dnf install nginx -y
```

### Explanation

* sudo = Run command as administrator.
* dnf = Package manager used in Rocky Linux.
* install = Install a package.
* nginx = Package name.
* -y = Automatically answer "yes" to prompts.

### Purpose

Install the Nginx web server.

---

## Step 2: Start Nginx

### Command

```bash
sudo systemctl start nginx
```

### Explanation

* systemctl = Manage systemd services.
* start = Start a service.
* nginx = Service name.

### Purpose

Start the Nginx service.

---

## Step 3: Verify Nginx Status

### Command

```bash
sudo systemctl status nginx
```

### Explanation

* status = Show current state of the service.

### Purpose

Confirm that Nginx is running successfully.

Expected Output:

```text
active (running)
```

---

## Step 4: Find Nginx Process ID (PID)

### Command

```bash
ps -ef | grep nginx
```

### Explanation

* ps = Display running processes.
* -e = Show all processes.
* -f = Full-format listing.
* | = Pipe output.
* grep nginx = Search for nginx processes.

### Purpose

Find the PID of the Nginx process.

Example Output:

```text
root 1456 1 nginx
```

PID = 1456

---

## Step 5: Kill Nginx Using SIGKILL (-9)

### Command

```bash
sudo kill -9 PID
```

Example:

```bash
sudo kill -9 1456
```

### Explanation

* kill = Send signal to process.
* -9 = SIGKILL (forcefully terminate).
* PID = Process ID.

### Purpose

Forcefully stop Nginx.

---

## Step 6: Verify Nginx Has Stopped

### Command

```bash
sudo systemctl status nginx
```

### Purpose

Confirm Nginx is no longer running.

---

## Step 7: Create Override Directory

### Command

```bash
sudo mkdir -p /etc/systemd/system/nginx.service.d
```

### Explanation

* mkdir = Create directory.
* -p = Create parent directories if needed.

### Purpose

Create a directory for custom Nginx service settings.

---

## Step 8: Create Restart Configuration

### Command

```bash
sudo nano /etc/systemd/system/nginx.service.d/restart.conf
```

Paste the following:

```ini
[Service]
Restart=on-failure
RestartSec=5
```

Save and Exit.

### Explanation

* [Service] = Service configuration section.
* Restart=on-failure = Restart only when service crashes.
* RestartSec=5 = Wait 5 seconds before restarting.

### Purpose

Enable automatic recovery of Nginx after failure.

---

## Step 9: Reload Systemd Configuration

### Command

```bash
sudo systemctl daemon-reload
```

### Explanation

* daemon-reload = Reload systemd unit files.

### Purpose

Apply newly created configuration.

---

## Step 10: Restart Nginx

### Command

```bash
sudo systemctl restart nginx
```

### Purpose

Apply restart policy configuration.

---

## Step 11: Verify Restart Policy

### Command

```bash
sudo systemctl show nginx | grep Restart
```

### Explanation

* show = Display service properties.
* grep Restart = Filter restart-related settings.

### Purpose

Verify restart settings are active.

Expected Output:

```text
Restart=on-failure
RestartUSec=5s
```

---

## Step 12: Kill Nginx Again

### Find PID

```bash
ps -ef | grep nginx
```

### Kill Process

```bash
sudo kill -9 PID
```

Example:

```bash
sudo kill -9 1456
```

### Purpose

Test whether automatic restart works.

---

## Step 13: Wait for Restart

### Command

```bash
sleep 6
```

### Explanation

* sleep = Pause execution.
* 6 = Wait 6 seconds.

### Purpose

Allow systemd enough time to restart Nginx.

---

## Step 14: Verify Auto-Restart

### Command

```bash
sudo systemctl status nginx
```

### Purpose

Confirm Nginx automatically restarted.

Expected Output:

```text
active (running)
```

---

# Create Custom Health Logger Service

## Step 15: Create Health Logger Script

### Command

```bash
sudo nano /usr/local/bin/health_logger.sh
```

Paste:

```bash
#!/bin/bash

echo "$(date) : Health Check Running" >> /var/log/health.log
```

Save and Exit.

### Explanation

* #!/bin/bash = Use Bash shell.
* date = Current date and time.
* echo = Print text.
* > > = Append output to file.
* /var/log/health.log = Log file location.

### Purpose

Create a script that writes health check messages into a log file.

---

## Step 16: Make Script Executable

### Command

```bash
sudo chmod +x /usr/local/bin/health_logger.sh
```

### Explanation

* chmod = Change permissions.
* +x = Add execute permission.

### Purpose

Allow the script to run as a program.

---

## Step 17: Create Custom Service Unit File

### Command

```bash
sudo nano /etc/systemd/system/health-logger.service
```

Paste:

```ini
[Unit]
Description=Custom Health Logger Service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/health_logger.sh

[Install]
WantedBy=multi-user.target
```

Save and Exit.

---

## Step 18: Unit File Explanation

### [Unit]

```ini
[Unit]
```

Purpose: Contains metadata and dependencies.

### Description

```ini
Description=Custom Health Logger Service
```

Purpose: Human-readable service description.

### After

```ini
After=network.target
```

Purpose: Start service after network initialization.

### [Service]

```ini
[Service]
```

Purpose: Service execution settings.

### Type=simple

```ini
Type=simple
```

Purpose: Service starts immediately and runs in foreground.

### ExecStart

```ini
ExecStart=/usr/local/bin/health_logger.sh
```

Purpose: Command executed when service starts.

### [Install]

```ini
[Install]
```

Purpose: Defines boot-time behavior.

### WantedBy

```ini
WantedBy=multi-user.target
```

Purpose: Start service automatically during normal system boot.

---

## Step 19: Reload Systemd

### Command

```bash
sudo systemctl daemon-reload
```

### Purpose

Load the newly created service file.

---

## Step 20: Enable Service

### Command

```bash
sudo systemctl enable health-logger.service
```

### Explanation

* enable = Start service automatically at boot.

### Purpose

Ensure service persists after reboot.

---

## Step 21: Start Service

### Command

```bash
sudo systemctl start health-logger.service
```

### Purpose

Run the service immediately.

---

## Step 22: Verify Service Status

### Command

```bash
sudo systemctl status health-logger.service
```

### Purpose

Confirm the service is working.

---

## Step 23: Monitor Logs

### Command

```bash
sudo journalctl -u health-logger.service -f
```

### Explanation

* journalctl = View system logs.
* -u = Specific service/unit.
* -f = Follow logs in real time.

### Purpose

Monitor service activity live.

---

## Step 24: Verify Log File

### Command

```bash
cat /var/log/health.log
```

### Explanation

* cat = Display file contents.

### Purpose

Verify that the script is writing logs successfully.

Expected Output:

```text
Sat Jun 21 12:00:01 IST 2026 : Health Check Running
```




# Key Learning


When working with systemd services, I first thought that if nginx crashed, the system would automatically bring it back. After installing nginx and killing the process using `kill -9`, I noticed that nginx stayed completely stopped because a SIGKILL signal gives the application no chance to shut down cleanly. That helped me understand the difference between a normal service failure and a forcefully terminated process.

While modifying the service configuration, I learned that systemd behavior is controlled through directives inside the unit file. Adding `Restart=on-failure` and `RestartSec=5` made the service automatically restart after a failure, but only after waiting five seconds. After reloading systemd and testing again, nginx restarted on its own, which confirmed that the restart policy was working correctly.

Creating a custom health-logger service showed me that systemd can manage much more than standard packages. A simple Bash script can be converted into a managed service by creating a custom unit file, defining how the script starts, and enabling it. Watching logs with `journalctl -u your-service -f` was especially useful because it displayed live output directly from the service, making troubleshooting much easier.

The unit file became much clearer once I understood what each line does. `[Unit]` contains service metadata and dependencies, `[Service]` defines how the script runs, `ExecStart=` specifies the command to execute, `Restart=` controls restart behavior, `RestartSec=` sets the delay before restarting, and `[Install]` determines how the service is enabled during system boot.

This is very similar to production cloud environments where services must recover automatically from failures without manual intervention. Restart policies, custom monitoring services, and centralized logging through systemd are common practices on Linux servers running in cloud platforms, containers, and enterprise infrastructure. These mechanisms help maintain uptime and allow operations teams to quickly diagnose issues through logs instead of manually checking every process.



















