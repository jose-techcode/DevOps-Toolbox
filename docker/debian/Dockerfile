# Use an official Debian image

FROM debian:latest

# Create the directory for /scripts

RUN mkdir -p /scripts

# Copy update_clean.sh script

COPY ./scripts/debian/update-clean.sh /scripts/debian/update-clean.sh
RUN chmod +x /scripts/debian/update-clean.sh

# Copy files_organization.sh script

COPY ./scripts/debian/files-organization.sh /scripts/debian/files-organization.sh
RUN chmod +x /scripts/debian/files-organization.sh

# Copy files_backup.sh script

COPY ./scripts/debian/files-backup.sh /scripts/debian/files-backup.sh
RUN chmod +x /scripts/debian/files-backup.sh

# Define the directory inside the container

WORKDIR /workspace

# Define the entrypoint with shell scripting (bash) and run test scripts in docker container

ENTRYPOINT ["/bin/bash", "-c", "/scripts/debian/update_clean.sh && /scripts/debian/files_organization.sh && /scripts/debian/files_backup.sh"]