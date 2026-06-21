
# Thinking Questions – systemd & Logging


1. systemctl enable vs systemctl start

When I first heard systemctl enable and systemctl start, I thought they both did the same thing because after running either command, the service seemed to work. Then I understood that they solve two completely different problems. start means "run the service right now," while enable means "automatically start the service during boot."

A service can be enabled but stopped. For example, I may enable nginx on a server so that it automatically starts after every reboot, but I temporarily stop it for maintenance using systemctl stop nginx. In that situation, the service is enabled yet currently not running.

A service can also be started but not enabled. For example, I might start a testing database service for a lab exercise using systemctl start mariadb, but I do not want it consuming resources every time the server boots. The service works now, but after a reboot it will not come back automatically.

The real lesson is that enable controls future boots, while start controls the current running state. Production administrators often use both together: systemctl enable --now nginx.

2. Why does Restart=on-failure restart crashes but not manual stops?

When I first learned about Restart=on-failure, I assumed systemd would restart the service no matter what happened. Then I understood that systemd treats a crash and an intentional stop as two completely different events.

A crash means something unexpected happened. The process exited with an error, was killed, or failed. In that case systemd assumes the service should still be running and automatically restarts it.

A manual stop means a human administrator deliberately requested the service to stop using systemctl stop. If systemd restarted the service immediately after that command, the administrator would lose control of the system.

Imagine a production web server consuming 100% CPU because of a bug. An administrator may stop nginx to investigate the issue. If Restart=on-failure ignored the difference between a crash and a manual stop, nginx would instantly restart and make troubleshooting impossible.

The distinction is important because systemd must balance reliability with administrator control. Crashes are unexpected and should be recovered automatically. Manual stops are intentional and should be respected.



3. Using journalctl to create an alert when nginx crashes

When I first heard people compare journalctl to CloudWatch Logs, I thought it was just a command to read logs. Then I understood that logs are valuable because they allow automation and monitoring.

The idea is simple: monitor the systemd logs for nginx failures. A script can periodically check recent journal entries for words such as "failed", "crashed", or a failed service state. If such an event appears, the script sends an email notification.

A real-world workflow would be:

Use journalctl -u nginx.service to view nginx logs.
Search recent entries for failure messages.
If a failure is detected, send an email using mailx or another mail utility.
Run the script every minute using cron.

Example logic:
```

journalctl -u nginx.service --since "1 minute ago" | grep -i "failed"

```

If the command returns output, the script can send an email saying:

"Alert: nginx service has crashed on production server."

This is similar to how cloud platforms monitor logs and generate alerts automatically. The difference is that instead of paying for a managed monitoring service, Linux gives you the building blocks to create your own solution.

4. Restart=always keeps bringing back the app. How do you find the real problem?

When I first saw Restart=always, I thought it was the perfect solution because the application never stayed down. Then I realized that automatic restarts can hide serious issues.

If a web application crashes every three minutes and systemd immediately restarts it, users may barely notice the outage. However, the underlying bug still exists and could eventually cause data corruption, performance issues, or complete failure.

Instead of relying only on restarts, I would investigate the root cause:

1. Check service logs using:

```
  journalctl -u myapp.service

```

2. Look for error messages, stack traces, memory issues, or dependency failures.
3. Check resource usage:

```
  free -h
top
df -h

```

4. Verify application configuration files.
5. Reproduce the crash manually and observe what happens.
6. Review application-specific logs in /var/log/.

A good analogy is a car engine. If the engine stalls every few minutes and automatically restarts itself, the car appears functional. But the real problem—bad fuel, overheating, or a damaged component—still exists. The restart mechanism improves availability, but troubleshooting the logs reveals the actual cause.

The lesson is that Restart=always is a safety net, not a fix. The real job of a system administrator is to identify why the service is failing in the first place and eliminate the root cause.
