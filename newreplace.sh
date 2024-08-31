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
    echo
}

# Function to perform find and replace
find_and_replace() {
    echo -e " $G Finding and replacing '$FIND_STRING' with '$REPLACE_STRING' in all text files...$N "
 #   for file in "$DIRECTORY"/*.txt;
 #    do
#
 #       for $FIND_STRING in $file
 #       if [ -f "$file" ]; then
 #           if grep -q "$FIND_STRING" "$file"; then
 #           sed -i "s/$FIND_STRING/$REPLACE_STRING/g" "$file"
 #       fi
 #       else "not found"
 #       exit 1
 #           fi
 #   done
 #   echo "Replacement done."

  for file in "$DIRECTORY"/*.txt; do
        if [ -f "$file" ]; then
            # Check if the file contains the find string
            if grep -q "$FIND_STRING" "$file"; then
                # Perform the replacement
                sed -i "s/$FIND_STRING/$REPLACE_STRING/g" "$file"
                found=1
            fi
        else
            echo "File '$file' does not exist."
        fi
    done
}
# List files before replacement

list_files 
echo -e " $Y files before replacement $N "

# Perform find and replace
find_and_replace

# List files after replacement
echo -e " $G files after replacement $N "
list_files

