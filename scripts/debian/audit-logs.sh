#!/bin/bash

# Sudo

# Stop in first error

set -e

# Shows the last 10 lines of the syslog (system log)

echo "-----System log-----"
echo ""

tail -n 10 /var/log/syslog # You can increase the number of log lines in -n

echo ""

# Shows the last 10 lines of the authlog (authentication log)

echo "-----Authentication log-----"
echo ""

tail -n 10 /var/log/auth.log # You can increase the number of log lines in -n

echo ""

# Optional: shows the last 10 lines of the kernlog (kernel log)

# echo "-----Kernel log-----"
# echo ""

# tail -n 10 /var/log/kern.log # You can increase the number of log lines in -n

# echo ""

# Optional: shows the last 10 lines of the boot log

# echo "-----Boot log-----"
# echo ""

# tail -n 10 /var/log/boot.log # You can increase the number of log lines in -n

# echo ""

# Optional: shows the last 10 lines of the user log

# echo "-----User log-----"
# echo ""

# tail -n 10 /var/log/user.log # You can increase the number of log lines in -n

# echo ""