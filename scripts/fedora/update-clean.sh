#!/bin/bash

# Sudo

# Stop in first error

set -e

# Update packages

echo "-----Updating packages-----"
echo ""

dnf update

echo ""

# Upgrade packages

echo "-----Upgrading packages-----"
echo ""

dnf upgrade -y

echo ""

# Remove orphaned dependencies

echo "-----Removing orphaned dependencies-----"
echo ""

dnf autoremove -y

echo ""

# Optional: Remove packages cache

# echo "-----Removing packages cache-----"
# echo ""

# dnf clean all

# echo ""