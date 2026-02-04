# Use an official Debian image

FROM debian:latest

# Create the directory for /scripts

RUN mkdir -p /scripts

# Copy update_clean.sh script

COPY scripts/debian/update_clean.sh /scripts/debian/update_clean.sh
RUN chmod +x /scripts/debian/update_clean.sh

# Copy files_organization.sh script

COPY scripts/debian/files_organization.sh /scripts/debian/files_organization.sh
RUN chmod +x /scripts/debian/files_organization.sh

# Copy files_backup.sh script

COPY scripts/debian/files_backup.sh /scripts/debian/files_backup.sh
RUN chmod +x /scripts/debian/files_backup.sh

# Define the directory inside the container

WORKDIR /workspace

# Define the entrypoint with shell scripting (bash) and run test scripts in docker container

ENTRYPOINT ["/bin/bash", "-c", "/scripts/debian/update_clean.sh && /scripts/debian/files_organization.sh && /scripts/debian/files_backup.sh"]