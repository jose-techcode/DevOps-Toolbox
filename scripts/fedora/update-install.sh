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

# Install common dependencies

echo "-----Installing commomn dependencies-----"
echo ""

dnf install -y wget ca-certificates curl gnupg lsb-release

echo ""

# -----GIT-----

echo "-----Installing git-----"
echo ""

dnf install -y git

echo ""

# -----VS CODIUM-----

echo "-----Installing vs codium-----"
echo ""

tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

dnf install codium

echo ""

# -----DOCKER-----

echo "-----Installing docker-----"
echo ""

dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo --overwrite

dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl enable --now docker

docker run hello-world

echo ""

# -----TRIVY-----

echo "-----Installing trivy-----"
echo ""

cat << EOF | tee -a /etc/yum.repos.d/trivy.repo
[trivy]
name=Trivy repository
baseurl=https://aquasecurity.github.io/trivy-repo/rpm/releases/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://aquasecurity.github.io/trivy-repo/rpm/public.key
EOF
yum -y update
yum -y install trivy

echo ""

# -----ANSIBLE-----

echo "-----Installing ansible-----"
echo ""

dnf install ansible

echo ""

# -----TERRAFORM-----

echo "-----Installing terraform-----"
echo ""

wget -O- https://rpm.releases.hashicorp.com/fedora/hashicorp.repo | tee /etc/yum.repos.d/hashicorp.repo
yum list available | grep hashicorp
dnf -y install terraform

echo ""
