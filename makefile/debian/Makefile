all: echo # to not run any script unintentionally

# Test (to not run any script unintentionally)

echo:
	@echo "Makefile"

# sudo make logs

logs:
	../../scripts/debian/audit-logs.sh

# make backup

backup:
	../../scripts/debian/files-backup.sh

# make organization

organization:
	../../scripts/debian/files-organization.sh

# sudo make clean

clean:
	../../scripts/debian/update-clean.sh

# sudo make install

install:
	../../scripts/debian/update-install.sh

# make image

image:
	../../docker/debian/docker-trivy.sh