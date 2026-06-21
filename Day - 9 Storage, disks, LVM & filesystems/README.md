
# Group - 1 Disk, Filesystem & LVM Setup




<img width="1280" height="800" alt="9 1 1" src="https://github.com/user-attachments/assets/ee80885a-f584-4765-921f-b3fa0a77c82b" />




<img width="1280" height="800" alt="9 1" src="https://github.com/user-attachments/assets/f0730a28-bbd6-4d23-928b-8c4df9c14acd" />





| Command                  | What it does                                     | When you use it                                                               |
| ------------------------ | ------------------------------------------------ | ----------------------------------------------------------------------------- |
| lsblk                    | Displays all disks and partitions in tree format | When you plug a new disk and need to identify its name before any operation   |
| mkfs.xfs /dev/sdb1       | Formats a partition with XFS filesystem          | When preparing a fresh partition for storing data or mounting                 |
| df -hT                   | Shows disk usage with filesystem types           | When checking storage usage or verifying mounted filesystems                  |
| /etc/fstab               | File used to define auto-mount rules at boot     | When you want a disk to mount automatically after reboot                      |
| vgcreate datavg /dev/sdb | Creates a Volume Group for LVM storage pooling   | When setting up scalable storage management for servers or production systems |






# Group - 2 Filesystem Administration Toolkit




<img width="1280" height="800" alt="9 2" src="https://github.com/user-attachments/assets/0cf286b2-c383-492a-aa05-92c78d285db5" />




| Command                     | What it does                                   | When you use it                                                          |
| --------------------------- | ---------------------------------------------- | ------------------------------------------------------------------------ |
| `fdisk -l`                  | Shows all disks and partitions in the system   | When you plug in a new disk or want to verify disk layout before changes |
| `mount /dev/sdb1 /mnt/data` | Attaches a partition to a directory            | When a disk is ready but not accessible yet                              |
| `vgextend myvg /dev/sdc`    | Adds a new disk into LVM storage pool          | When you need to increase storage capacity in LVM setup                  |
| `xfs_growfs /mnt/data`      | Expands XFS filesystem to use extra space      | After extending disk/LVM and filesystem needs resizing                   |
| `tune2fs -l /dev/sdb2`      | Displays filesystem metadata (ext filesystems) | When diagnosing filesystem health or checking details                    |
| `du -sh /var/log/*`         | Shows disk usage of log files and folders      | When troubleshooting high disk usage or cleaning logs                    |






# Group - 3 Linux Storage




<img width="1280" height="800" alt="9 3" src="https://github.com/user-attachments/assets/8b877350-bdf1-4c33-ba10-779f2d671014" />




| Command                            | What it does                                        | When you use it                                               |
| ---------------------------------- | --------------------------------------------------- | ------------------------------------------------------------- |
| `fdisk /dev/sdb`                   | Creates or modifies disk partitions on a raw disk   | When preparing a new disk before LVM setup or OS installation |
| `lvcreate -L 5G -n datalv vg_name` | Allocates a 5GB logical volume from a volume group  | When you need a new virtual disk space for storage or apps    |
| `resize2fs /dev/vg/lv`             | Expands or shrinks filesystem inside logical volume | After increasing LV size to make OS recognize new space       |
| `mount -a`                         | Mounts all filesystems listed in `/etc/fstab`       | After editing fstab or reboot to mount all configured disks   |
| `lvremove /dev/vg/lv`              | Deletes a logical volume completely                 | When freeing up storage or removing unused LV                 |
| `vgremove vg_name`                 | Deletes an entire volume group                      | When dismantling LVM setup or repurposing disks               |
| `pvremove /dev/sdX`                | Clears LVM metadata from a physical disk            | Before reusing disk for non-LVM or fresh setup                |




# Group - 4 LVM Management Workflow




<img width="1280" height="800" alt="9 4" src="https://github.com/user-attachments/assets/a672003a-8872-4202-88fa-2a336e62cd01" />




| Command                             | What it does                                     | When you use it                                              |
| ----------------------------------- | ------------------------------------------------ | ------------------------------------------------------------ |
| `blkid`                             | Displays block device UUIDs and filesystem types | When identifying disks or verifying partitions before setup  |
| `umount /mnt/data`                  | Detaches a mounted filesystem safely             | Before modifying, repairing, or resizing a mounted partition |
| `pvcreate /dev/sdb`                 | Converts a disk into an LVM physical volume      | When initializing a new disk for LVM storage management      |
| `lvextend -L +2G /dev/vg/lv`        | Increases size of an existing logical volume     | When storage inside LVM needs expansion without downtime     |
| `pvdisplay / vgdisplay / lvdisplay` | Shows detailed LVM configuration info            | When auditing or troubleshooting storage architecture        |
| `fsck /dev/sdb1`                    | Checks and repairs filesystem inconsistencies    | When filesystem corruption or boot errors are suspected      |











