#!/bin/bash

# Check that the input file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <access_log_file>"
  exit 1
fi

# Run awk command to extract unique IP addresses and their frequency of occurrence
awk '
  # Use the first field as the index in the count array
  { count[$1]++ }
  
  # Print the unique IP addresses and their frequency of occurrence
  END {
    for(ip in count) {
      print ip, count[ip]
    }
  }
' "$1"

