#!/bin/bash

# Sudo

# Stop in first error

set -e

## Shows the last 10 lines of the journal log

echo "-----System log-----"
echo ""

journalctl -n 10

echo ""

## -----Shows the last 10 lines of the authentication log-----

# echo "-----Authentication log-----"
# echo ""

# journalctl -n 10 -u sshd.service

# echo ""

## -----Shows the last 10 lines of the kernel log-----

# echo "-----Kernel log-----"
# echo ""

# journalctl -k -n 10

# echo ""

## -----Shows the last 10 lines of the boot log-----

# echo "-----Boot log-----"
# echo ""

# journalctl -b -n 10

# echo ""

## -----Shows the last 10 lines of the user-----

# echo "-----User log-----"
# echo ""

# journalctl -n 10 --user

# echo ""