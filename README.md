# Pipeline Data Processing

This project fetches pipeline data from an API, aggregates the results, and generates an infographic showing the distribution of pipeline job statuses.

## Prerequisites

### Platforms

- Unix-like operating system (Linux, macOS, WSL on Windows)

### Tools and Libraries

1. **Shell**
    - `curl`: Command-line tool for transferring data with URLs.
    - `jq`: Command-line JSON processor.
    - `awk`: Pattern scanning and processing language.

2. **Python**
    - `pandas`: Data manipulation and analysis library.
    - `matplotlib`: Plotting library for creating static, animated, and interactive visualizations.

### Installation

#### Installing Dependencies

1. **Install curl**
   ```bash
   sudo apt-get install curl    # For Debian/Ubuntu
   brew install curl            # For macOS with Homebrew

2. **Install jq**
    ```bash
    sudo apt-get install jq      # For Debian/Ubuntu
    brew install jq              # For macOS with Homebrew

3. **Install awk**
    ```bash
    sudo apt-get install gawk    # For Debian/Ubuntu
    brew install gawk            # For macOS with Homebrew

4. **Install Pythonn and pip**
    ```bash
    sudo apt-get install python3 python3-pip    # For Debian/Ubuntu
    brew install python                         # For macOS with Homebrew

5. **Install Python libraries**
    ```bash
    pip3 install pandas matplotlib

### Configuration

1. **Authorization Token**
    - Update the fetch_and_aggregate.sh script inside the "shell" directory with your actual authorization token:
    ```bash
    AUTH_TOKEN="your_actual_token_here"

### Directory Structure

Place the scripts in the following directory structure:

    .
    ├── run.sh
    ├── shell
    │   └── fetch_and_aggregate.sh
    └── python
        └── generate_infographic.py

### Usage

1. **Make Scripts Executable**
    - Ensure all scripts have executable permissions:
    ```bash
    chmod +x shell/fetch_and_aggregate.sh
    chmod +x run.sh

2. **Execute the run.sh Script**
    - Run the script from the root directory:
    ```bash
    ./run.sh -v

### Output

1. **The script will generate two files in the root directory**
    - pipeline_job_summary.csv: Aggregated pipeline data.
    - pipeline_job_summary.jpg: Infographic showing the distribution of pipeline job statuses.

### Troubleshooting

1. **Failed to create CSV file**
    - Ensure the fetch_and_aggregate.sh script has the correct path for the output file.
    - Verify that the API endpoint and authorization token are correct.

2. **Failed to create infographic**
    - Ensure the CSV file was created successfully.
    - Verify that the Python script has access to the necessary libraries.

### Summary

This project automates the process of fetching pipeline data, aggregating it, and generating an infographic. By following the instructions and setting up the necessary dependencies, you can visualize pipeline job statuses effectively.