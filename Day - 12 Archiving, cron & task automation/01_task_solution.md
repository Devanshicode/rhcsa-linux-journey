
# Task 12 - Automated Backup Script

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
