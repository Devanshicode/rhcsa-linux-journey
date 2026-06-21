# Task 14 – Run Nginx in Podman Container with Monitoring

## Step 1

Command:

```bash
sudo dnf install podman -y
```

Explanation: Installs Podman container engine.

Purpose: Required to create and manage containers.

---

## Step 2

Command:

```bash
podman --version
```

Explanation: Displays installed Podman version.

Purpose: Verifies installation.

---

## Step 3

Command:

```bash
podman pull nginx
```

Explanation: Downloads nginx container image.

Purpose: Makes nginx image available locally.

---

## Step 4

Command:

```bash
podman run -d --name mynginx -p 8080:80 nginx
```

Explanation: Creates nginx container running in background.

Purpose: Hosts nginx on port 8080.

---

## Step 5

Command:

```bash
podman ps
```

Explanation: Lists running containers.

Purpose: Confirms container is active.

---

## Step 6

Command:

```bash
curl http://localhost:8080
```

Explanation: Sends HTTP request to nginx.

Purpose: Tests container accessibility.

---

## Step 7

Command:

```bash
podman exec -it mynginx /bin/bash
```

Explanation: Opens shell inside container.

Purpose: Allows modification of container files.

---

## Step 8

Command:

```bash
echo "<h1>Hello from Devanshi's Container</h1>" > /usr/share/nginx/html/index.html
```

Explanation: Replaces default webpage.

Purpose: Creates custom content.

---

## Step 9

Command:

```bash
exit
```

Explanation: Leaves container shell.

Purpose: Returns to host system.

---

## Step 10

Command:

```bash
curl http://localhost:8080
```

Explanation: Requests webpage again.

Purpose: Verifies custom HTML page.

---

## Step 11

Command:

```bash
podman generate systemd --name mynginx --files
```

Explanation: Generates systemd service file.

Purpose: Integrates container with system startup.

---

## Step 12

Command:

```bash
sudo cp container-mynginx.service /etc/systemd/system/
```

Explanation: Copies service file to systemd directory.

Purpose: Makes service available to systemd.

---

## Step 13

Command:

```bash
sudo systemctl daemon-reload
```

Explanation: Reloads systemd configuration.

Purpose: Registers newly added service.

---

## Step 14

Command:

```bash
sudo systemctl enable container-mynginx.service
```

Explanation: Enables automatic startup on boot.

Purpose: Container starts automatically after reboot.

---

## Step 15

Command:

```bash
sudo systemctl start container-mynginx.service
```

Explanation: Starts service immediately.

Purpose: Runs container using systemd.

---

## Step 16

Command:

```bash
systemctl status container-mynginx.service
```

Explanation: Displays service status.

Purpose: Verifies service health.

---

## Step 17

Command:

```bash
podman stats
```

Explanation: Shows CPU, memory, and network usage.

Purpose: Monitors container resources.

---

## Step 18

Command:

```bash
sudo nano /usr/local/bin/container-monitor.sh
```

Explanation: Creates monitoring script.

Purpose: Enables automatic recovery.

---

## Step 19

Script:

```bash
#!/bin/bash

if ! podman ps | grep -q mynginx
then
    echo "$(date) : mynginx stopped. Restarting..." >> /var/log/container-monitor.log
    podman start mynginx
fi
```

Explanation: Checks whether container is running and restarts it if stopped.

Purpose: Implements self-healing container monitoring.

---

## Step 20

Command:

```bash
sudo chmod +x /usr/local/bin/container-monitor.sh
```

Explanation: Makes script executable.

Purpose: Allows script execution.

---

## Step 21

Command:

```bash
podman stop mynginx
sudo /usr/local/bin/container-monitor.sh
podman ps
```

Explanation: Stops container, runs monitoring script, and verifies restart.

Purpose: Tests automatic recovery functionality.

