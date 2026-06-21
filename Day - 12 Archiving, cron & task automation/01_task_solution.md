
# Task 12 - Automated Backup Script



<img width="1280" height="800" alt="task - 12" src="https://github.com/user-attachments/assets/528ea062-e20e-4ffd-9d31-386fe98dbc6e" />



## Objective
Write backup.sh: archives /etc and /srv with date in filename, excludes *.log, uses rsync to sync to /backup/latest/, rotates backups keeping only last 7, logs all actions with timestamps, uses flock to prevent concurrent runs. Schedule it daily at 2AM. Test with --dry-run first.



## Step 1 - Create Backup Directory

Command:
sudo mkdir -p /backup/latest

Explanation:
Creates backup destination directory.

Purpose:
Store backup archives and latest synchronized backup.

---

## Step 2 - Create Backup Script

Command:
sudo nano /usr/local/bin/backup.sh

Explanation:
Creates custom backup script.

Purpose:
Automate backup process.

---

## Step 3 - Add Script

(Insert backup.sh script)

Purpose:

* Backup /etc and /srv
* Exclude *.log files
* Add date to archive name
* Sync using rsync
* Keep only last 7 backups
* Log actions
* Prevent concurrent execution using flock

---

## Step 4 - Make Executable

Command:
sudo chmod +x /usr/local/bin/backup.sh

Explanation:
Adds execute permission.

Purpose:
Allows script execution.

---

## Step 5 - Test Sync Using Dry Run

Command:
rsync -av --delete --dry-run /backup/ /backup/latest/

Explanation:
Shows actions without modifying files.

Purpose:
Safely verify synchronization.

---

## Step 6 - Run Script

Command:
sudo /usr/local/bin/backup.sh

Explanation:
Executes backup script.

Purpose:
Verify backup functionality.

---

## Step 7 - Verify Backup

Command:
ls -lh /backup

Explanation:
Displays created archives.

Purpose:
Confirm backup file exists.

---

## Step 8 - Verify Logs

Command:
cat /var/log/backup.log

Explanation:
Displays backup log entries.

Purpose:
Confirm timestamps and actions.

---

## Step 9 - Schedule Daily at 2 AM

Command:
sudo crontab -e

Add:
0 2 * * * /usr/local/bin/backup.sh

Explanation:
Creates daily cron job.

Purpose:
Automate backup execution.

---

## Step 10 - Verify Cron Job

Command:
sudo crontab -l

Explanation:
Displays configured cron jobs.

Purpose:
Confirm scheduling is active.




# Key Learning 



At first I thought creating a backup script was just about making a tar archive of important directories. While building the script, I learned that a production backup process involves much more than simply compressing files. The archive needed a date in its filename so every backup could be identified easily, and excluding *.log files reduced unnecessary storage usage because logs can grow very large. Using rsync to maintain a continuously updated /backup/latest/ copy was also interesting because it provides quick access to the most recent data without extracting archives.

Another thing I learned was that backup jobs can create problems if they start again before a previous run finishes. To avoid this, flock was used so only one instance of the script can run at a time. I also had to implement backup rotation because without cleanup, backup files would keep accumulating and eventually consume disk space. Keeping only the latest seven backups solved that issue. Adding timestamped logging made troubleshooting much easier since every action performed by the script is recorded and can be reviewed later.

Testing with --dry-run before performing the actual rsync operation was very useful because it showed exactly what changes would be made without modifying any files. This helped verify the script safely before scheduling it through cron to run automatically every day at 2 AM.

This is very similar to how backup automation works in cloud and enterprise environments. Production Linux servers, AWS EC2 instances, and corporate infrastructure teams rely on scheduled backups, retention policies, synchronization tools like rsync, execution locks, and detailed logs to ensure data protection, prevent storage issues, and recover systems quickly when failures occur.















