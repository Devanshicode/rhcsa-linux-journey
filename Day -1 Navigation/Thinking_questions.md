
## Questions I thought and its Solution



### Q1: Why does `cp --parents` preserve structure but normal `cp` doesn't? What is `cp` actually doing differently?

**Answer:**

When I first used cp, I assumed it would automatically remember where files came from. Then I realized that normal cp only copies the file itself and ignores its original location. If multiple files have the same name, they can end up mixed together in one folder.

What surprised me was the --parents option. It tells cp to recreate the complete path of the file inside the backup directory. This makes the backup much more organized and easier to restore later.

I now understand that normal cp focuses only on the file, while cp --parents focuses on both the file and its original location.

---

### Q2: rm -rf has no undo — what does this teach me about how Linux trusts its users vs Windows which asks "Are you sure?"

**Answer:**

When I first learned that rm -rf has no undo option, I thought Linux was being risky. I was used to Windows moving deleted files to the Recycle Bin or showing confirmation messages.

After using Linux more, I understood that Linux follows a different philosophy. It assumes that if a user runs a command, they know what they are doing. The system trusts the user and does not add extra confirmation steps.

This also taught me why Linux administrators are always careful before running commands as root. A single wrong path in `rm -rf` can delete important files instantly. In real cloud environments, this is why engineers create backups before making major changes. The system gives you power, but it also expects responsibility.

---

### Q3: `find` uses `-mtime` for time and `-name` for filename — how would I combine BOTH in one command to find `.conf` files modified in the last 7 days?

**Answer:**

At first, I thought I would need two separate commands one for finding '.conf' files and another for checking modification time. Then I realized that 'find' can apply multiple conditions at the same time.

The command would be:

* find /etc -name '*.conf' -mtime -7

This searches for files that satisfy both conditions:

1. The filename ends with '.conf'
2. The file was modified within the last 7 days

What I learned here is that 'find' acts like a filter. Each option removes files that do not match until only the required files remain.

---

### Q4: In AWS, this task is equal to an S3 backup script. How would the `find + cp` logic translate to `aws s3 cp` commands?

**Answer:**

When I first saw this question, I thought Linux backups and AWS backups would be completely different. Then I realized the idea is actually the same.

In Linux, I used 'find' to locate important files and 'cp' to copy them into a backup folder.

In AWS, instead of copying files to another local folder, I would copy them to an S3 bucket. The logic becomes:

* Find important files
        ↓
  Copy them
        ↓
  Store them in a safe backup location

The only difference is that the backup location is now cloud storage instead of a local directory.

For example:

aws s3 cp file.conf s3://my-backup-bucket/


What surprised me is that many cloud automation scripts are just Linux commands combined with cloud tools. The concepts I practiced in this task—searching files, copying them, preserving structure, and verifying backups—are the same skills used by cloud engineers when building automated backup solutions for AWS servers.




