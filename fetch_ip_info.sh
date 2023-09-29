#!/bin/bash

# Author: Ahmed Fikri
# 2023

# Check if the input file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <ip_list_file>"
  exit 1
fi

# Define the output file
output_file="ip_info.json"

# Loop through each IP address in the input file
while IFS= read -r ip; do
  # Use curl to query ipinfo.io for the IP address and save the result to the output file
  curl -sS "https://ipinfo.io/$ip/json" >> "$output_file"
  # Add a newline between each JSON object
  echo "" >> "$output_file"
done < "$1"

echo "IP information has been fetched and saved to $output_file."

