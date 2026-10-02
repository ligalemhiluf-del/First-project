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

# 1. Check if both arguments are provided
# $# counts the number of arguments. If it's less than 2, show an error and exit.
if [ $# -lt 2 ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <directory_name> <file_name>"
    exit 1
fi

# 2. Assign command-line arguments to variables
DIR_NAME="$1"
FILE_NAME="$2"

# 3. Create the subdirectory (-p prevents errors if it already exists)
mkdir -p "$DIR_NAME"

# 4. Create the empty file inside that directory
touch "$DIR_NAME/$FILE_NAME"

# 5. Confirmation message
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully!"
