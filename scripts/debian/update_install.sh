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

# Install common dependencies

echo "-----Installing commomn dependencies-----"
echo ""

apt install -y software-properties-common apt-transport-https wget ca-certificates curl gnupg lsb-release

echo ""

# -----VS CODE-----

# Repository

echo "-----Adding repository-----"
echo ""

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/

cat <<EOF > /etc/apt/sources.list.d/vscode.sources
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

rm microsoft.gpg

echo ""

# -----CLAMAV-----

echo "-----Installing clamav and clamtk-----"
echo ""

apt install clamav clamtk

echo ""

# -----UFW-----

echo "-----Installing ufw and gufw-----"
echo ""

apt install ufw gufw

echo "-----Enabling ufw-----"
echo ""

ufw enable

echo ""

# Note: configure the firewall to activate protection

# -----Fail2ban-----

echo "-----Installing fail2ban-----"
echo ""

apt install fail2ban

echo "-----Enabling and starting fail2ban"
echo ""

systemctl enable --now fail2ban

echo ""

# Note: configure the fail2ban to block brute force of SSH

# -----GIT & CLI TOOLS-----

# Installation of git, nano, vim, htop and neofetch

echo "-----Installing git, nano, vim, htop and neofetch-----"
echo ""

apt install -y git nano vim htop neofetch

echo ""

# -----DOCKER-----

# lsb-release

# echo "-----Installing lsb-release-----"
# echo ""

# apt update && apt install -y lsb-release

# echo ""

# Official key

# echo "-----Adding official key-----"
# echo ""

# curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# echo ""

# Repository

# echo "-----Adding repository-----"
# echo ""

# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# echo ""

# Update and installation

# echo "-----Updating packages and installing docker-----"
# echo ""

# apt update
# apt install -y docker-ce docker-ce-cli containerd.io

# echo ""

# Optional: -----TRIVY----- (for scan docker image)