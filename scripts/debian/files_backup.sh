#!/bin/bash

# Stop in first error

set -e

# Root use prohibited

if [ "$EUID" -eq 0 ]; then
    echo "Don't execute this script with root permissions."
    exit 1
fi

# Conditional check for loading directories

if [ -f "$HOME/.config/user-dirs.dirs" ]; then
    source "$HOME/.config/user-dirs.dirs"
fi

# Destination directory

DESTINATION="${XDG_DOCUMENTS_DIR:-$HOME/Documentos}/backup"
mkdir -p "$DESTINATION"

# File name of backup

FILE="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Directories to include in the backup

INCLUDE=(
    "${XDG_DOCUMENTS_DIR:-$HOME/Documentos}"
    "${XDG_PICTURES_DIR:-$HOME/Imagens}"
    "${XDG_VIDEOS_DIR:-$HOME/Videos}"
    "${XDG_MUSIC_DIR:-$HOME/Musica}"
    "${XDG_DOWNLOAD_DIR:-$HOME/Downloads}"
)

# Creates a backup within the documents directory

tar -czf "$DESTINATION/$FILE" "${INCLUDE[@]}" || true

echo "Created backup in: $DESTINATION/$FILE"