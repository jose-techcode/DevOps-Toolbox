#!/bin/bash

# Stop in first error

set -e

# Root use proibithed

if [ $EUID -eq 0 ]; then
    echo "Don't execute this script with root permission."
    exit 1
fi

# Building the docker image

docker build -t devops-toolbox .

# Scan the docker image with trivy tool (false positives are expected)

trivy image devops-toolbox:latest