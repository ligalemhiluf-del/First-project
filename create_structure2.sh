#!/bin/bash

# ==============================================================================
# HOW TO RUN THIS SCRIPT:
# 
# Method 1: As a standalone executable (Recommended)
#   1. Give execution permissions:  chmod +x create_structure.sh
#   2. Run with arguments:          ./create_structure.sh my_folder my_file.txt
#
# Method 2: Inside the current shell
#   Run with arguments:             source create_structure.sh my_folder my_file.txt
# ==============================================================================

# 1. Assign command-line arguments to variables
DIR_NAME="$1"
FILE_NAME="$2"

# 2. Create the subdirectory (-p prevents errors if it already exists)
mkdir -p "$DIR_NAME"

# 3. Create the empty file inside that directory
touch "$DIR_NAME/$FILE_NAME"

# 4. Confirmation message
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully!"

