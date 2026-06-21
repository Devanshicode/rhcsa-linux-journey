
# Thinking Questions – RPM, DNF, and AWS

## 1. `rpm -qf /usr/bin/ssh` tells you which package owns a file. When would a sysadmin need this in a security incident?

When I first learned that `rpm -qf` can tell you which package owns a file, it seemed like a simple package-management command. Then I realized its value during a security incident. Imagine an attacker replaces `/usr/bin/ssh` with a malicious version that steals credentials. The first question a sysadmin asks is: "Where did this file come from?" By running `rpm -qf /usr/bin/ssh`, the admin can identify which RPM package originally installed the file.

The real power comes when this information is combined with package verification. If the file belongs to the OpenSSH package but has been modified, the admin knows the system may have been compromised. This helps separate legitimate system files from suspicious ones and speeds up incident response. In a security investigation, tracing file ownership is often the first step toward understanding what changed and how the attacker gained access.

---

## 2. `dnf history undo` is like a Git revert for packages. What are the limits? Can you undo a `dnf update` that broke the kernel?

When I first heard about `dnf history undo`, I thought it worked exactly like Git and could reverse any mistake forever. Then I learned that package management is more complicated than source code version control. `dnf history undo` can reverse many package installations, removals, and updates, but only if the required older packages are still available in repositories or local caches.

A broken kernel is a good example. If a kernel update causes boot problems, `dnf history undo` may be able to reinstall the previous kernel package. However, it is not guaranteed. If the older package has been removed from repositories or the system no longer has access to it, the rollback may fail. This is why Linux keeps multiple kernel versions installed by default. A safer recovery method is often selecting an older kernel from the GRUB boot menu rather than relying entirely on `dnf history undo`.

The lesson is that `dnf history undo` is a powerful safety net, but it is not a perfect time machine.

---

## 3. A rogue package installs itself via `rpm -ivh`, bypassing DNF. How would you detect it?

When I first learned that RPM can install packages directly using `rpm -ivh`, I assumed DNF would always know about them. Then I discovered that DNF only records transactions it performs itself. A package installed manually through RPM can appear on the system without showing up in DNF history.

A sysadmin can detect this by maintaining regular snapshots of installed packages using commands such as `rpm -qa`. By comparing today's package list with an older baseline, any unexpected package additions become visible. If a new package appears but there is no corresponding DNF transaction, that is a strong sign that it may have been installed manually or through an unauthorized process.

This is similar to security cameras in a building. If someone enters through an emergency exit instead of the main entrance, the visitor log may not show them, but the camera footage still reveals their presence. Regularly comparing `rpm -qa` output helps uncover software that bypassed normal package-management procedures.

---

## 4. In AWS, EC2 User Data runs `dnf install` commands on first boot. What happens if the internet connection fails mid-install? How do you make it retry?

When I first saw EC2 User Data scripts, I assumed they would keep trying until everything succeeded. Then I learned that User Data is usually executed only once during the first boot. If a `dnf install` command loses internet connectivity halfway through, the installation can fail and the script may stop before the server is fully configured.

In a production environment, this can leave an EC2 instance in an inconsistent state where some packages are installed and others are missing. To prevent this, sysadmins add retry logic to their scripts. For example, a loop can repeatedly attempt the installation until it succeeds, waiting a few seconds between attempts. Some teams also use automation tools such as Cloud-Init, Ansible, or AWS Systems Manager to ensure failed tasks are retried automatically.

The important lesson is that cloud automation must assume networks can fail at any moment. Reliable infrastructure is not about avoiding failures—it is about designing systems that recover from them automatically.
