all: echo # to not run any script unintentionally

# Test (to not run any script unintentionally)

echo:
	@echo "Makefile"

# sudo make logs

logs:
	scripts/debian/audit_logs.sh

# make backup

backup:
	scripts/debian/files_backup.sh

# make organization

organization:
	scripts/debian/files_organization.sh

# sudo make clean

clean:
	scripts/debian/update_clean.sh

# sudo make install

install:
	scripts/debian/update_install.sh

# make image

image:
	docker-debian/docker_trivy.sh