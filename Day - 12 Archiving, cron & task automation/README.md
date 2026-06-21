
# Group - 1 Linux Backup, Synchronization


<img width="1280" height="800" alt="12 1" src="https://github.com/user-attachments/assets/5dda9155-d71a-4e27-bec5-4ef117a53658" />



<img width="1280" height="800" alt="12 1 1" src="https://github.com/user-attachments/assets/737580e2-99a0-4d05-bbb7-3136b764a079" />





| Command                               | What It Does                              | When I Use It                   |
| ------------------------------------- | ----------------------------------------- | ------------------------------- |
| `tar -czvf backup.tar.gz /etc/`       | Creates compressed backup archive         | Backup system configuration     |
| `tar --exclude='*.log'`               | Excludes matching files from archive      | Skip logs and temporary files   |
| `rsync -av --dry-run source/ backup/` | Simulates synchronization without changes | Test backups safely             |
| `Cron Time Format`                    | Defines schedule for cron jobs            | Automating recurring tasks      |
| `/etc/cron.daily/`                    | Directory for daily cron scripts          | Daily maintenance jobs          |
| `systemd timers`                      | Modern scheduling mechanism               | Automated tasks on modern Linux |







# Group - 2 Compression & Scheduling Commands




<img width="1280" height="800" alt="12 2 1" src="https://github.com/user-attachments/assets/5507b0a1-313a-47ea-9e9c-4e48ebc6daaa" />



<img width="1280" height="800" alt="12 2" src="https://github.com/user-attachments/assets/53f94976-6129-4b64-9e50-32e1f9a1a3d9" />





| Command                              | What It Does                                     | When I Use It                              |
| ------------------------------------ | ------------------------------------------------ | ------------------------------------------ |
| `logrotate`                          | Rotates, compresses and manages log files        | Log maintenance and server administration  |
| `tar -xzvf archive.tar.gz`           | Extracts compressed tar archive                  | Restore backups and unpack software        |
| `gzip file`                          | Compresses a file                                | Save storage and reduce file size          |
| `gunzip file.gz`                     | Decompresses a gzip file                         | Restore compressed files                   |
| `rsync -av --delete source/ backup/` | Synchronizes directories and removes extra files | Backups, mirroring, server synchronization |
| `crontab -l`                         | Lists scheduled cron jobs                        | Verify and manage recurring tasks          |
| `at now + 5 minutes`                 | Schedules a one-time future task                 | Delayed execution of commands              |






# Group - 3 Archiving, File Monitoring




<img width="1280" height="800" alt="12 3" src="https://github.com/user-attachments/assets/31ab14e5-406a-4493-b84c-07b78f5c9813" />






| Command                    | What It Does                                                  | When I Use It                             |
| -------------------------- | ------------------------------------------------------------- | ----------------------------------------- |
| `zip -r archive.zip dir/`  | Creates a ZIP archive of a directory recursively              | Backups, sharing folders, compression     |
| `inotifywait file`         | Monitors file changes in real time                            | Automation, file monitoring, log watching |
| `tar -tzvf archive.tar.gz` | Lists contents of a compressed tar archive without extracting | Verify backups and archive contents       |
| `rsync -avz src/ dst/`     | Synchronizes directories efficiently                          | Backups, migrations, incremental sync     |
| `crontab -e`               | Opens cron scheduler editor                                   | Automating recurring tasks                |






# Group - 4 Linux Job Scheduling, Automation & Backup Commands





<img width="1280" height="800" alt="12 4" src="https://github.com/user-attachments/assets/600e424a-95fd-404a-be24-0982c9707a43" />





| Command                            | What It Does                          | When I Use It                   |
| ---------------------------------- | ------------------------------------- | ------------------------------- |
| `grep CRON /var/log/cron`          | Shows cron execution logs             | Verify scheduled jobs ran       |
| `cat /etc/anacrontab`              | Displays anacron configuration        | View missed-job scheduling      |
| `anacron -n`                       | Runs pending anacron jobs immediately | Testing or catching missed jobs |
| `find project -name "*.txt"`       | Searches for matching files           | Locate files before backup      |
| `tar -czvf backup.tar.gz project/` | Creates compressed archive            | Backups and archiving           |
| `tar -tvf backup.tar.gz`           | Lists archive contents                | Verify backup integrity         |
| `flock -n /tmp/lockfile cmd`       | Prevents duplicate command execution  | Cron jobs, scripts, backups     |


