#!/bin/bash

# Author: Ahmed Fikri 
# 2023

# Check if the correct number of command-line arguments is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 folder_path"
  exit 1
fi

# Store the provided folder path argument
folder_path="$1"

# Verify if the folder exists
if [ ! -d "$folder_path" ]; then
  echo "Folder '$folder_path' does not exist."
  exit 1
fi

# Loop through all files in the folder
for file in "$folder_path"/*; do
  if [ -f "$file" ]; then
    # Generate a new file name by converting the file name to lowercase
    new_file_name=$(basename "$file" | tr '[:upper:]' '[:lower:]')
    
    # Rename the file by moving it to the new name
    mv "$file" "$folder_path/$new_file_name"
    
    # Print the renaming command that was executed
    echo "Renamed '$file' to '$new_file_name'"
  fi
done

