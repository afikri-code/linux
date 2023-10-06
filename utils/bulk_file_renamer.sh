#!/bin/bash

# Author: Ahmed Fikri
# 2023

# Check if the correct number of command-line arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 folder_path string_to_replace new_string"
  exit 1
fi

# Store the provided arguments in descriptive variables
folder_path="$1"
string_to_replace="$2"
new_string="$3"

# Verify if the folder exists
if [ ! -d "$folder_path" ]; then
  echo "Folder '$folder_path' does not exist."
  exit 1
fi

# Loop through all files in the folder that have the specified string in their name
for file in "$folder_path"/*"$string_to_replace"*; do
  if [ -f "$file" ]; then
    # Generate a new file name by substituting the specified string
    new_file_name=$(echo "$file" | sed "s/$string_to_replace/$new_string/g")
    
    # Rename the file by moving it to the new name
    mv "$file" "$new_file_name"
    
    # Print the renaming command that was executed
    echo "Renamed '$file' to '$new_file_name'"
  fi
done

