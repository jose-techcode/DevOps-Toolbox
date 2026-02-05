all: echo # to not run any script unintentionally

# Test (to not run any script unintentionally)

echo:
	@echo "Makefile"

# sudo make logs

logs:
	../../scripts/fedora/audit-logs.sh

# make backup

backup:
	../../scripts/fedora/files-backup.sh

# make organization

organization:
	../../scripts/fedora/files-organization.sh

# sudo make clean

clean:
	../../scripts/fedora/update-clean.sh

# sudo make install

install:
	../../scripts/fedora/update-install.sh

# make image

image:
	../../docker/fedora/docker-trivy.sh