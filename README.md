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


