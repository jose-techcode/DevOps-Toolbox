# Use an official Fedora image

FROM fedora:latest

# Create the directory for /scripts

RUN mkdir -p /scripts

# Copy update_clean.sh script

COPY scripts/fedora/update_clean.sh /scripts/fedora/update_clean.sh
RUN chmod +x /scripts/fedora/update_clean.sh

# Copy files_organization.sh script

COPY scripts/fedora/files_organization.sh /scripts/fedora/files_organization.sh
RUN chmod +x /scripts/fedora/files_organization.sh

# Copy files_backup.sh script

COPY scripts/fedora/files_backup.sh /scripts/fedora/files_backup.sh
RUN chmod +x /scripts/fedora/files_backup.sh

# Define the directory inside the container

WORKDIR /workspace

# Define the entrypoint with shell scripting (bash) and run test scripts in docker container

ENTRYPOINT ["/bin/bash", "-c", "/scripts/fedora/update_clean.sh && /scripts/fedora/files_organization.sh && /scripts/fedora/files_backup.sh"]