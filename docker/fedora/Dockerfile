# Use an official Fedora image

FROM fedora:latest

# Create the directory for /scripts

RUN mkdir -p /scripts

# Copy update_clean.sh script

COPY ./scripts/fedora/update-clean.sh /scripts/fedora/update-clean.sh
RUN chmod +x /scripts/fedora/update-clean.sh

# Copy files_organization.sh script

COPY ./scripts/fedora/files-organization.sh /scripts/fedora/files-organization.sh
RUN chmod +x /scripts/fedora/files-organization.sh

# Copy files_backup.sh script

COPY ./scripts/fedora/files-backup.sh /scripts/fedora/files-backup.sh
RUN chmod +x /scripts/fedora/files-backup.sh

# Define the directory inside the container

WORKDIR /workspace

# Define the entrypoint with shell scripting (bash) and run test scripts in docker container

ENTRYPOINT ["/bin/bash", "-c", "/scripts/fedora/update-clean.sh && /scripts/fedora/files-organization.sh && /scripts/fedora/files-backup.sh"]