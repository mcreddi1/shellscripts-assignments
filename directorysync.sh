#!/bin/bash

# Source and destination directories
source_dir="/path/to/source"
destination_dir="/path/to/destination"

# Check if both directories exist
if [ ! -d "$source_dir" ]; then
    echo "Error: Source directory '$source_dir' not found."
    exit 1
fi

if [ ! -d "$destination_dir" ]; then
    echo "Error: Destination directory '$destination_dir' not found."
    exit 1
fi

# Synchronize directories using rsync
rsync_options="-av --update --ignore-existing --progress --exclude='.git/'"  # Adjust options as needed

rsync "$rsync_options" "$source_dir/" "$destination_dir/"

# Check rsync exit status
if [ $? -ne 0 ]; then
    echo "Error: Failed to synchronize directories."
    exit 1
else
    echo "Directories synchronized successfully."
fi

# Optional: Check for any files that couldn't be copied due to errors
# This can include locked files or permission issues
failed_files="$(find "$source_dir" -type f -newermt "$(date -R -d '-1 minute')" -exec cp -n {} "$destination_dir" \; 2>&1 | grep -E 'cannot (open|stat|create)' | awk -F ': ' '{print $2}')"

if [ -n "$failed_files" ]; then
    echo "Warning: Some files could not be copied due to errors:"
    echo "$failed_files"
fi