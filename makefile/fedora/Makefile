all: echo # to not run any script unintentionally

# Test (to not run any script unintentionally)

echo:
	@echo "Makefile"

# sudo make logs

logs:
	scripts/fedora/audit_logs.sh

# make backup

backup:
	scripts/fedora/files_backup.sh

# make organization

organization:
	scripts/fedora/files_organization.sh

# sudo make clean

clean:
	scripts/fedora/update_clean.sh

# sudo make install

install:
	scripts/fedora/update_install.sh

# make image

image:
	docker-fedora/docker_trivy.sh