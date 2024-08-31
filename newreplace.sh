#!/bin/bash

# Define the directory and the strings to find and replace
DIRECTORY=$1
FIND_STRING=$2
REPLACE_STRING=$3

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <string_to_replace> <new_String>"
    exit 1
fi

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' not found."
    exit 1
fi

# Function to list files in a directory
list_files() {
    echo "Files in directory ($DIRECTORY):"
    ls -1 "$DIRECTORY"
    cat $DIRECTORY/*
    echo
}

# Function to perform find and replace
find_and_replace() {
    echo "Finding and replacing '$FIND_STRING' with '$REPLACE_STRING' in all text files..."
    for file in "$DIRECTORY"/*.txt; do
        if [ -f "$file" ]; then
            sed -i "s/$FIND_STRING/$REPLACE_STRING/g" "$file"
        fi
    done
    echo "Replacement done."
}

# List files before replacement
list_files 
echo -e "$Y files before replacement $N"

# Perform find and replace
find_and_replace

# List files after replacement
list_files
echo -e "$G files after replacement $N"
