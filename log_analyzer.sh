#!/bin/bash

# File name: log_analyzer.sh
# Usage: ./log_analyzer.sh access.log

LOGFILE=$1

if [[ -z "$LOGFILE" || ! -f "$LOGFILE" ]]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

echo "Top 5 IP addresses"
awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5

echo ""
echo "Top 5 requested paths"
awk '{print $7}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5

echo ""
echo "Top 5 response status codes"
awk '{print $9}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5

echo ""
echo "Top 5 user agents"
awk -F\" '{print $6}' "$LOGFILE" | sort | uniq -c | sort -nr | head -5
