# Check that the input file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <access_log_file>"
  exit 1
fi

# Run awk command to extract unique IP addresses and access dates
awk '
  # Use the first field as the IP address and the fourth and fifth fields as the access date
  {
    ip = $1
    date = $4 " " $5
    count[ip]++
    access[ip] = date
  }

  # Print the unique IP addresses and their corresponding access dates
  END {
    for(ip in count) {
      print "IP Address:", ip, "Access Date:", access[ip], "Count:", count[ip]
    }
  }
' "$1"
