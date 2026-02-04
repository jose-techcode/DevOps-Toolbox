#!/bin/bash

# Sudo

# Stop in first error

set -e

# Update packages

echo "-----Updating packages-----"
echo ""

apt update

echo ""

# Upgrade packages

echo "-----Upgrading packages-----"
echo ""

apt upgrade -y

echo ""

# Optional: apt full-upgrade -y (can replace or remove packages if necessary to update them)

# Full upgrade of packages

# echo "-----Full upgrade of packages-----"
# echo ""

# apt full-upgrade -y

# echo ""

# Remove orphaned dependencies

echo "-----Removing orphaned dependencies-----"
echo ""

apt autoremove -y

echo ""

# Clean old packages

echo "-----Cleaning old packages-----"
echo ""

apt autoclean -y

echo ""

# Optional: apt clean (careful with your packages)

# Completely clean the cache

# echo "-----Completely cleaning the cache-----"
# echo ""

# apt clean

# echo ""