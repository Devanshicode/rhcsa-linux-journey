#!/bin/bash

echo "===== SECURITY AUDIT REPORT ====="

echo
echo "1. SUID Files"
find / -perm -4000 2>/dev/null

echo
echo "2. World Writable Directories"
find / -type d -perm -0002 2>/dev/null

echo
echo "3. Failed Login Attempts"
journalctl | grep "Failed password"

echo
echo "4. Open Ports"
ss -tulnp
