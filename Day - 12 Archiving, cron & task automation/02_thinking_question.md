
# Thinking Questions – Backup & Automation

## 1. Cron uses server local time. Your backup runs at 2 AM IST. Your company's US server backup also runs at 2 AM EST. Both hit the same NFS storage simultaneously. What happens? How do you fix it?

When I first heard that cron uses the server's local time, I thought scheduling backups at 2 AM everywhere would naturally spread the workload. Then I understood that 2 AM is different in every timezone, but large environments often have multiple servers running their own 2 AM schedules. If both the India server and the US server start heavy backups that eventually reach the same NFS storage at the same moment, the storage can become overloaded. This may cause slow backups, high I/O wait, network congestion, longer completion times, or even backup failures.

The real lesson is that time-based jobs must be planned globally, not per server. The fix is to coordinate backup windows using a common timezone such as UTC, stagger backup schedules, or implement backup orchestration so different servers run at different times. In production environments, avoiding resource contention is just as important as creating the backup itself.

---

## 2. flock prevents concurrent cron runs. But what if the first backup process hangs forever? The lock is never released. How do you handle that?

When I first learned about flock, I thought it completely solved the problem of multiple backup jobs running at the same time. Then I realized flock only works if the original process eventually exits. If a backup process hangs forever because of a network issue, NFS freeze, or software bug, the lock remains active and every future cron job will be skipped.

The real-world lesson is that preventing concurrency is not enough; we must also handle failures. A common solution is to run the backup command with a timeout so that hung processes are automatically terminated after a defined period. Monitoring and alerting can also detect long-running jobs before they become a problem. In production systems, a lock without a recovery strategy can turn one failed backup into many days of missed backups.

---

## 3. rsync --delete removes files from destination not in source. If someone accidentally deletes a file from source, rsync will delete it from backup too. How do you protect against this?

When I first saw rsync --delete, I thought it was useful because it keeps the backup identical to the source. Then I understood the hidden danger: if someone accidentally deletes an important file from the source, the next backup will faithfully delete that file from the backup as well. The backup becomes an exact copy of the mistake.

The real lesson is that a backup should protect against human error, not copy it. This is why production backup systems often use snapshots, versioned backups, retention policies, or backup rotation. Instead of keeping only the latest copy, they preserve older versions so deleted files can be recovered later. Technologies such as ZFS snapshots, cloud object versioning, or incremental backups provide protection against accidental deletions that simple rsync mirroring cannot.

---

## 4. Systemd timers vs cron — systemd timers have built-in logging via journalctl. Why does this matter for a DevOps engineer at 3 AM trying to find why the backup failed?

When I first compared cron and systemd timers, they looked like two different ways to schedule tasks. Then I realized the biggest difference appears when something breaks. A cron job may fail silently unless output is redirected to log files or email notifications are configured. Finding the cause often requires searching through multiple log locations.

Systemd timers automatically integrate with journalctl, which records execution details, timestamps, exit codes, and error messages in a central location. For a DevOps engineer troubleshooting a failed backup at 3 AM, this is extremely valuable because the evidence is already collected and searchable. Instead of guessing what happened, the engineer can quickly inspect the logs and identify the root cause. In production environments, faster troubleshooting reduces downtime and makes system maintenance much more reliable.
