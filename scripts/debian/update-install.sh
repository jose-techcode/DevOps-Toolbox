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

apt install -y wget ca-certificates curl gnupg lsb-release

echo ""

# -----UFW-----

echo "-----Installing ufw and gufw-----"
echo ""

apt install ufw gufw

echo "-----Enabling ufw-----"
echo ""

ufw enable

echo ""

# -----GIT-----

echo "-----Installing git-----"
echo ""

apt install -y git

echo ""

# -----VS CODIUM-----

echo "-----Installing vs codium-----"
echo ""

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
| tee /etc/apt/sources.list.d/vscodium.sources

apt update && apt install codium

echo ""

# -----DOCKER-----

echo "-----Installing docker-----"
echo ""

apt update
apt install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

apt update

apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker run hello-world

echo ""

# -----TERRAFORM-----

echo "-----Installing terraform-----"
echo ""

wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt update && apt install terraform

echo ""

# -----ANSIBLE-----

echo "-----Installing ansible-----"
echo ""

apt install ansible

echo ""

# -----TRIVY-----

echo "-----Installing trivy-----"
echo ""

apt-get install wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | tee -a /etc/apt/sources.list.d/trivy.list
apt-get update
apt-get install trivy

echo ""