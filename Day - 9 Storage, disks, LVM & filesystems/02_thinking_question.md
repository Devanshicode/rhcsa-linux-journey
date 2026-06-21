
# Thinking Questions – Storage, LVM, and Filesystem Concepts

## 1. Why UUID in `/etc/fstab` instead of `/dev/sdb1`?

When I first saw UUIDs in `/etc/fstab`, I thought using `/dev/sdb1` would be much simpler because it is easier to read and remember. Then I understood that Linux does not guarantee device names remain the same after every reboot. If I connect a USB drive, add a new disk, or change the boot order, today's `/dev/sdb1` might become `/dev/sdc1` tomorrow.

UUID (Universally Unique Identifier) is permanently assigned to a filesystem and does not change when device names change. Linux uses UUIDs in `fstab` to make sure the correct partition is mounted every time, regardless of how the kernel names the devices.

The real-world danger is that if `fstab` points to `/dev/sdb1` and the device order changes, Linux may fail to boot properly or mount the wrong partition. Using UUID prevents this problem and makes storage configuration reliable on production servers.

---

## 2. LVM lets you extend a volume while files are open and mounted. What Linux capability makes this possible?

When I first learned that LVM could grow a filesystem without unmounting it, I thought Linux must secretly stop applications in the background. Then I understood that Linux supports online filesystem resizing.

The kernel's Virtual File System (VFS) layer separates applications from the physical storage underneath. Applications interact with files through the filesystem, while LVM manages the underlying block devices. Because of this abstraction layer, LVM can add storage to a logical volume and filesystems such as XFS can expand into the new space while users continue working.

The real-world version of this happens in production environments where databases, web servers, and applications run 24/7. Administrators can increase storage without downtime, which is critical because stopping services could impact thousands of users.

---

## 3. `df` shows 90% usage but `du` only shows 50%. Where is the missing space?

When I first saw `df` and `du` reporting different disk usage numbers, I thought one of the commands was broken. Then I understood that they measure storage differently.

`df` reports how much space the filesystem has allocated, while `du` measures files and directories that are currently visible in the directory tree. If a large file is deleted while a process is still using it, the file disappears from the directory structure, so `du` cannot see it. However, the disk blocks remain allocated until the process closes the file.

As a result, `df` still reports the space as used even though `du` cannot find the file. This often happens with log files that are deleted while services continue running.

The real-world fix is to identify the process holding the deleted file using:

```bash
lsof | grep deleted
```

and then restart the service or process. Once the file handle is released, Linux frees the disk space.

---

## 4. AWS EBS "Modify Volume" does exactly what `lvextend` + `xfs_growfs` does. Explain.

When I first clicked the "Modify Volume" button in AWS, I thought AWS was performing some special cloud magic behind the scenes. Then I understood that AWS is simply automating storage operations that Linux administrators have been performing for years.

When an EBS volume is expanded, AWS increases the size of the underlying virtual disk. Inside the Linux instance, the operating system still needs to recognize the new space and extend the filesystem. This is equivalent to extending an LVM logical volume using `lvextend` and then growing the filesystem using commands such as `xfs_growfs`.

The cloud console hides the complexity, but the same storage principles are being applied underneath. Understanding this helps me see that cloud services are often built on top of traditional Linux concepts rather than replacing them.

The real-world benefit is that when something goes wrong in AWS, an administrator who understands LVM and filesystem growth can troubleshoot the issue confidently instead of relying only on the cloud interface.
