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

# Source (Downloads)

SOURCE="$HOME/Downloads"

# Destination

DOCUMENTS_DIR="${XDG_DOCUMENTS_DIR:-$HOME/Documentos}"
MUSIC_DIR="${XDG_MUSIC_DIR:-$HOME/Musica}"
PICTURES_DIR="${XDG_PICTURES_DIR:-$HOME/Imagens}"
VIDEOS_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}"

mkdir -p "$DOCUMENTS_DIR" "$MUSIC_DIR" "$PICTURES_DIR" "$VIDEOS_DIR"

# Avoid errors if there are no files with the extension

shopt -s nullglob

# Function for move files (reusable)

files_organization() {
    local dest="$1"
    shift
    local moved=false
    for ext in "$@"; do
        for file in "$SOURCE/"*."$ext"; do
            echo "Moving: $file → $dest"
            mv "$file" "$dest/"
            moved=true
        done
    done
    if [ "$moved" = false ]; then
        echo "No files with extension: ${*}"
    fi
}

# Calling each file type (if there is nothing to move, the script will run normally without moving)

files_organization "$DOCUMENTS_DIR" pdf doc docx odt txt rtf xls xlsx ods ppt pptx odp
files_organization "$MUSIC_DIR" mp3 wav ogg flac aac m4a wma opus aiff alac
files_organization "$PICTURES_DIR" jpg jpeg png gif bmp tif tiff svg webp
files_organization "$VIDEOS_DIR" mp4 mkv avi mov wmv flv webm m4v mpg mpeg 3gp ogv