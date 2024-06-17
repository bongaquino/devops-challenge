#!/bin/bash

# API endpoint and authorization token
API_URL="http://34.117.217.236/devops-interview/v1/pipeline"
AUTH_TOKEN="xxxxxxxx"

# Fetch the pipeline data
response=$(curl --silent --header "Authorization: Bearer $AUTH_TOKEN" $API_URL)

# Check if the response is valid JSON
if ! echo "$response" | jq empty; then
  echo "Failed to fetch or parse the pipeline data."
  exit 1
fi

# Process the JSON response and aggregate data
aggregated_data=$(echo "$response" | jq -r '
  .pipelines | group_by(.status) | map({
    status: .[0].status,
    reasons: (group_by(.reason) | map({
      reason: (if .[0].status == "failed" and .[0].reason == "think_it_passed" then empty else .[0].reason end),
      occurrences: length
    }) | .[])
  }) | .[] | .reasons |= map(select(.reason != null)) | .reasons[] | [.status, .reason, .occurrences] | @csv
')

# Define the output file path in the root directory
output_file="../pipeline_job_summary.csv"

# Output CSV header
echo "Status,Reason,Occurrences" > $output_file

# Output the aggregated data to CSV
echo "$aggregated_data" >> $output_file

# Check and clean data quality issues
# If any status or reason is empty, replace with 'n/a'
awk -F, '{
  if ($1 == "") $1 = "n/a";
  if ($2 == "") $2 = "n/a";
  print $0
}' $output_file > temp.csv && mv temp.csv $output_file

echo "Pipeline job summary exported to $output_file"
