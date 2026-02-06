# 1. DevOps Toolbox

The DevOps Toolbox is a toolbox that uses operations tools for learning and automates file backup, file organization, system cleanup, tool installation, and log auditing. The shell scripting language used was bash. If you want, you can schedule some scripts with cron, using crontab -e in the terminal. The Nano editor is recommended for cron.

# 2. Permissions (cd scripts/debian or cd scripts/fedora)

- `chmod +x audit-logs.sh`

- `chmod +x files-backup.sh`

- `chmod +x files-organization.sh`

- `chmod +x update-clean.sh`

- `chmod +x update-install.sh`

- (cd docker/debian or cd docker/fedora) `chmod +x docker-trivy.sh`

# 2.1. Features (cd scripts/debian or cd scripts/fedora)

- `sudo ./audit-logs.sh` - Audit of system log and authentication log.

- `./files-backup.sh` - Backup files from the documents, music, pictures, videos and downloads
directories.

- `./files-organization.sh` - Organizing file extensions into their respective directories.

- `sudo ./update-clean.sh` - Update and upgrade packages, remove orphaned dependencies and clean old packages.

- `sudo ./update-install.sh` - Update, upgrade and installs packages.

- (cd docker/debian or cd docker/fedora) `./docker-trivy.sh` - Build a Docker image and scan it with Trivy.

# 2.2. Makefile features (cd makefile/debian or cd makefile/fedora)

- `sudo make logs` - Audit of system log and authentication log.

- `make backup` - Backup files from the documents, music, pictures, videos and downloads
directories.

- `make organization` - Organizing file extensions into their respective directories.

- `sudo make clean` - Update and upgrade packages, remove orphaned dependencies and clean old packages.

- `sudo make install` - Update, upgrade and installs packages.

- `make image` - Build a Docker image and scan it with Trivy.

# 2.3. Ansible features (cd ansible/debian or ansible/fedora)

- `ansible-playbook playbook-sudo.yml --ask-become-pass` - Update, upgrade, remove orphaned dependencies, clean old packages and install packages.

- `ansible-playbook playbook-user.yml` - Organization of files by extensions and backup of files of main directories.

- **Note:**

If you use `ansible-playbook playbook-sudo.yml --ask-become-pass`, enter your user password that has sudo permission.

# 2.4. Cron guide

- Open the cron file

`crontab -e`

- Add scripts that can be scheduled, like the ones below (with &&)

`0 12 * * * /full/path/to/update_clean.sh && /full/path/to/files_organization.sh && /full/path/to/files_backup.sh`

- **Note:**

After adding the scripts, press CTRL + O + Enter to save and CTRL + X to exit. The scripts shown above will run at noon, so make sure you know how to set up cron scheduling.

# 3. Technologies

- Shell Scripting: Bash (5.3+)
- IaC Language (1): Terraform (1.14.4+)
- IaC Language (2): Ansible (2.18.12+)
- Environment: Linux/Debian(13+)/Fedora(42+)
- Code Versioning: Git (2.53.0+)
- Containerization: Docker (29.2.1+)
- Scanner: Trivy (0.69.1+)
- Logs: Prometheus (≈ 3.9.1+) & Grafana(≈ 12.3.2+)
- CI: Github Actions
- Optional: Cron

# 4. Clone the Repository

- Bash

`git clone https://github.com/jose-techcode/DevOps-Toolbox`

# 5. Project Folder

- Bash

`cd ~/Documentos/DevOps-Toolbox`

# 5.1. Scripts Folder

- Bash

`cd scripts`

# 5.2. Makefile Folder

- Bash

`cd makefile`

# 5.3. Docker Folder

- Bash

`cd docker`

# 5.4. Ansible Folder

- Bash

`cd ansible`

# 5.5. Terraform Folder

- Bash

`cd terraform`

# 6. Run in Docker (project root)

- Build the image

Debian: `docker build -t devops-toolbox -f docker/debian/Dockerfile .`

Fedora: `docker build -t devops-toolbox -f docker/fedora/Dockerfile .`

- Scan the Docker image with Trivy (false positives are expected)

`trivy image devops-toolbox:latest`

- Run the image with privileges

`docker run --rm --privileged devops-toolbox:latest`

# 6.1. Run in Docker (cd docker/debian or cd docker/fedora)

- Execute this script to build Docker image and scan with Trivy

`./docker_trivy.sh`

- Run the image with privileges

`docker run --rm --privileged devops-toolbox:latest`

# 6.2. Run in Docker (cd makefile/debian or makefile/fedora)

- Execute this makefile command to build Docker image and scan with Trivy

`make image`

- Run the image with privileges

`docker run --rm --privileged devops-toolbox:latest`

# 6.3. Run Prometheus and Grafana in Docker

- Run the docker-compose.yml

`docker compose up -d`

Acess localhost:9090 for Prometheus and localhost:3000 for Grafana. Grafana may take a while to fully load on localhost:3000. The username and password of Grafana is admin.

# 7. Terraform features (cd terraform/debian or cd terraform/fedora)

- `terraform init` (optional: -upgrade) - Start the project directory.

- `terraform plan` (optional: -out:your_plan.tfplan) - Show what terraform will create, change, and destroy.

- `terraform apply` (optional: -auto-approve) - Applies infrastructure provisioning (container).

- `terraform destroy` (optional: -auto-approve) - Destroy infrastrcture (container).

- `terraform fmt` - Formats the organization of .tf files.

- `terraform validate` - Check if the terraform configuration is correct.

- `terraform show` - Show the status of infrastructure.

- `terraform graph` - Show the dependency graph.

- **Note:** 

There are other Terraform commands, but they are not yet applicable to this project.

# 8. Contribution

Feel free to open Issues or submit Pull Requests.

# 9. License

This project is licensed under the MIT license.

# 10. Notes

The root folder (DevOps-Toolbox) of the project needs to be cloned into a directory called "Documentos" if you don't want to refactor everything to work. This scripting toolbox is intended exclusively for Debian and Fedora operating systems. It is not guaranteed to work on other Linux distributions without adaptation. Much of this project is for learning purposes.