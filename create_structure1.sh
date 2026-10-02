#!/bin/bash

# ==============================================================================
# HOW TO RUN THIS SCRIPT:
# 
# Method 1: As a standalone executable (Recommended)
#   1. Give execution permissions:  chmod +x create_structure.sh
#   2. Run the script:              ./create_structure.sh
#
# Method 2: Inside the current shell (Variables will persist in your terminal)
#   Run the script:                 source create_structure.sh
# ==============================================================================

# 1. Define folder and file names
DIR_NAME="my_subdirectory"
FILE_NAME="empty_file.txt"

# 2. Create the subdirectory (-p prevents errors if it already exists)
mkdir -p "$DIR_NAME"

# 3. Create the empty file inside that directory
touch "$DIR_NAME/$FILE_NAME"

# 4. Confirmation message
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully!"

