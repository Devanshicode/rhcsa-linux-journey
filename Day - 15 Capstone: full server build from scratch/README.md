
# Group - 1 System Integration, Backup Automation, Security Audit & SELinux Verification



<img width="1280" height="800" alt="15 1 1" src="https://github.com/user-attachments/assets/1cbd9d87-9238-41f3-af35-b45d7f11f363" />



<img width="1280" height="800" alt="15 1" src="https://github.com/user-attachments/assets/2d4fc620-6563-4b8e-9cae-16766d9f0428" />





| Command                               | What it does                                              | When I use it                             |
| ------------------------------------- | --------------------------------------------------------- | ----------------------------------------- |
| `curl http://localhost:8080`          | Tests application response (frontend/backend integration) | When checking if web app is working       |
| `tar -czvf backup.tar.gz /home/user/` | Creates compressed backup of files                        | Before updates, migration, or data safety |
| `crontab -e`                          | Schedules automatic tasks                                 | For daily/weekly backups or automation    |
| `bash security_audit.sh`              | Runs security audit checks                                | For system monitoring and security review |
| `ss -tulnp` (inside script)           | Shows open ports and services                             | Detecting exposed services                |
| `firewall-cmd --list-all`             | Shows firewall rules                                      | Checking network security                 |
| `journalctl -p 3 -xb`                 | Shows system errors                                       | Debugging failures and attacks            |
| `sestatus`                            | Checks SELinux status                                     | Verifying system security enforcement     |
| `getenforce`                          | Shows SELinux mode                                        | Quick security state check                |
| `ls -Z`                               | Shows SELinux file labels                                 | Checking file-level security context      |





# Group - 2 Linux Automation, User Management, Web Deployment & Git Versioning



<img width="1280" height="800" alt="15 2 1" src="https://github.com/user-attachments/assets/a2fb9f66-b7e5-49e6-9807-c66b15e36baf" />




<img width="1280" height="800" alt="15 2" src="https://github.com/user-attachments/assets/06c231bf-e6d0-4459-8d19-9e61cbf2a33a" />



| Command                                              | What It Does                                                 | When I Use It                                         |
| ---------------------------------------------------- | ------------------------------------------------------------ | ----------------------------------------------------- |
| `bash server_baseline.sh`                            | Executes a script that configures a new server automatically | New server setup, cloud deployment, VM initialization |
| `bash provision.sh -u alice -g devteam`              | Creates users, groups and permissions automatically          | User onboarding, lab setup, bulk user creation        |
| `vim /etc/nginx/conf.d/webapp.conf`                  | Opens Nginx reverse proxy configuration file                 | Deploying applications behind Nginx                   |
| `git tag -a v1.0 -m "RHCSA 15-day journey complete"` | Creates a version tag in Git                                 | Project completion, releases, milestones              |





# Group - 3 Linux Monitoring, Automation & Cron Scheduling




<img width="1280" height="800" alt="15 3" src="https://github.com/user-attachments/assets/f3fb4bfc-9ae4-4052-a360-be10e58d4186" />




| Command                                          | What It Does                                                            | When I Use It                                              |
| ------------------------------------------------ | ----------------------------------------------------------------------- | ---------------------------------------------------------- |
| `bash system_health.sh > /tmp/health_report.txt` | Runs health monitoring script and saves report to a file                | Daily health checks, audits, troubleshooting               |
| `bash service_monitor.sh`                        | Runs monitoring script that checks services and restarts them if needed | Server monitoring, automatic recovery                      |
| `crontab -l`                                     | Displays all scheduled cron jobs                                        | Verify automation schedules and troubleshooting cron tasks |




















