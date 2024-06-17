#!/bin/bash

# Define paths
SHELL_SCRIPT="./shell/fetch_and_aggregate.sh"
PYTHON_SCRIPT="./python/generate_infographic.py"

# Verbose flag
VERBOSE=false

# Check for -v flag
if [[ "$1" == "-v" ]]; then
    VERBOSE=true
fi

# Run the shell script to fetch and aggregate data
if [ "$VERBOSE" = true ]; then
    echo "Fetching and aggregating pipeline data..."
fi
bash $SHELL_SCRIPT

# Check if the CSV file was created successfully
CSV_FILE="../pipeline_job_summary.csv"
if [ -f "$CSV_FILE" ]; then
    if [ "$VERBOSE" = true ]; then
        echo "CSV file created successfully: $CSV_FILE"
    fi
else
    echo "Failed to create CSV file."
    exit 1
fi

# Run the Python script to generate the infographic
if [ "$VERBOSE" = true ]; then
    echo "Generating infographic from the CSV data..."
fi
python3 $PYTHON_SCRIPT

# Check if the infographic was created successfully
IMAGE_FILE="../pipeline_job_summary.jpg"
if [ -f "$IMAGE_FILE" ]; then
    if [ "$VERBOSE" = true ]; then
        echo "Infographic created successfully: $IMAGE_FILE"
    fi
else
    echo "Failed to create infographic."
    exit 1
fi

echo "Pipeline data processing completed successfully."