
# Task - 7 Systemd Service Management: nginx Recovery + Custom Health Logger Service


<img width="1280" height="800" alt="task 7 1" src="https://github.com/user-attachments/assets/64e5a3e5-f101-44b3-a427-08ac3fec6936" />



<img width="1280" height="800" alt="task 7 2" src="https://github.com/user-attachments/assets/dace1560-e826-45d5-a26f-d08e0dd79d8d" />







## Objective 
Install nginx. Kill it with -9 (it won't restart). Edit unit file to add Restart=on-failure RestartSec=5. Test auto-restart by killing again. Create a custom service unit for a bash health-logger script. Enable it. Verify with journalctl -u your-service -f. Write what each line of your unit file does.


STEP 1: Install nginx
```
sudo apt update
sudo apt install nginx -y
```

Explanation:
apt update → updates package list
apt install nginx → installs nginx web server
-y → auto confirms installation

Purpose:
Install web server service managed by systemd.

STEP 2: Start nginx service
```
sudo systemctl start nginx
```

Explanation:
Starts nginx service immediately using systemd


STEP 3: Check status
```
systemctl status nginx
```

Explanation:
Shows whether nginx is active/running or failed


STEP 4: Find nginx process
```
ps aux | grep nginx
```

Explanation:
Lists running nginx processes
Gives Process ID (PID)


STEP 5: Kill nginx forcefully
```
sudo kill -9 <PID>
```

Explanation:
kill → sends signal to process
-9 → SIGKILL (force stop, cannot be ignored)



STEP 6: Check status again
```
systemctl status nginx
```

Explanation:
Normally nginx will show failed
Because default Restart policy is OFF


STEP 7: Edit nginx systemd service
```
sudo systemctl edit nginx --full
```

Explanation:
Opens full systemd service file for nginx


STEP 8: Reload systemd changes
```
sudo systemctl daemon-reload
```

Explanation:
Reloads systemd configuration after changes



STEP 9: Restart nginx
```
sudo systemctl restart nginx
```



STEP 10: Kill nginx again
```
sudo kill -9 <PID>
```

STEP 11: Check status
```
systemctl status nginx
```

Expected result:
nginx comes back automatically after ~5 seconds



STEP 12: Create script file
```
sudo nano /usr/local/bin/health-logger.sh
```

```
#!/bin/bash

while true
do
  echo "Health OK: $(date)" >> /var/log/health.log
  sleep 10
done
```


Explanation:
Infinite loop
Writes system health log every 10 seconds
Stores logs in /var/log/health.log



STEP 13: Give execute permission
```
sudo chmod +x /usr/local/bin/health-logger.sh
```


STEP 14: Create service file
```
sudo nano /etc/systemd/system/health-logger.service
```


```
[Unit]
Description=Health Logger Service
After=network.target

[Service]
ExecStart=/usr/local/bin/health-logger.sh
Restart=always
RestartSec=5
User=root

[Install]
WantedBy=multi-user.target
```

STEP 15: Reload systemd
```
sudo systemctl daemon-reload
```


STEP 16: Enable service
```
sudo systemctl enable health-logger
```

STEP 17: Start service
```
sudo systemctl start health-logger

```

STEP 18: Live log monitoring
```
journalctl -u health-logger -f
```

Explanation:
-u → service name filter
-f → live streaming logs



# Key Insights I Learned














