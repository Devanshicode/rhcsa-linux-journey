
# Group - 1 Linux Backup, Synchronization







| Command                               | What It Does                              | When I Use It                   |
| ------------------------------------- | ----------------------------------------- | ------------------------------- |
| `tar -czvf backup.tar.gz /etc/`       | Creates compressed backup archive         | Backup system configuration     |
| `tar --exclude='*.log'`               | Excludes matching files from archive      | Skip logs and temporary files   |
| `rsync -av --dry-run source/ backup/` | Simulates synchronization without changes | Test backups safely             |
| `Cron Time Format`                    | Defines schedule for cron jobs            | Automating recurring tasks      |
| `/etc/cron.daily/`                    | Directory for daily cron scripts          | Daily maintenance jobs          |
| `systemd timers`                      | Modern scheduling mechanism               | Automated tasks on modern Linux |







# Group - 2 Compression & Scheduling Commands










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










| Command                    | What It Does                                                  | When I Use It                             |
| -------------------------- | ------------------------------------------------------------- | ----------------------------------------- |
| `zip -r archive.zip dir/`  | Creates a ZIP archive of a directory recursively              | Backups, sharing folders, compression     |
| `inotifywait file`         | Monitors file changes in real time                            | Automation, file monitoring, log watching |
| `tar -tzvf archive.tar.gz` | Lists contents of a compressed tar archive without extracting | Verify backups and archive contents       |
| `rsync -avz src/ dst/`     | Synchronizes directories efficiently                          | Backups, migrations, incremental sync     |
| `crontab -e`               | Opens cron scheduler editor                                   | Automating recurring tasks                |






# Group - 4 Linux Job Scheduling, Automation & Backup Commands










| Command                            | What It Does                          | When I Use It                   |
| ---------------------------------- | ------------------------------------- | ------------------------------- |
| `grep CRON /var/log/cron`          | Shows cron execution logs             | Verify scheduled jobs ran       |
| `cat /etc/anacrontab`              | Displays anacron configuration        | View missed-job scheduling      |
| `anacron -n`                       | Runs pending anacron jobs immediately | Testing or catching missed jobs |
| `find project -name "*.txt"`       | Searches for matching files           | Locate files before backup      |
| `tar -czvf backup.tar.gz project/` | Creates compressed archive            | Backups and archiving           |
| `tar -tvf backup.tar.gz`           | Lists archive contents                | Verify backup integrity         |
| `flock -n /tmp/lockfile cmd`       | Prevents duplicate command execution  | Cron jobs, scripts, backups     |


