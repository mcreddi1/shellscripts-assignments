#!/bin/bash

# Define the directory and the strings to find and replace
DIRECTORY=$1
FIND_STRING=$2
REPLACE_STRING=$3

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

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
    echo -e "$R files before replacement $N"
    echo
}

# Function to perform find and replace
find_and_replace() {
    echo "Finding and replacing '$FIND_STRING' with '$REPLACE_STRING' in all text files..."
    for file in "$DIRECTORY"/*.txt; do
        if [ -f "$file" ]; then
            sed -i -e "s/$FIND_STRING/$R $REPLACE_STRING $N/g" "$file"
        fi
    done
    echo "Replacement done."
}

echo "$G files after replacemet $N"
# List files before replacement
list_files

# Perform find and replace
find_and_replace

# List files after replacement
list_files
