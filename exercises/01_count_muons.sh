#!/bin/bash
# ==============================================================================
# Exercise 1: count the muons in events.csv
# Practices: grep, pipe (|), wc -l
#
# Run:  chmod +x exercises/01_count_muons.sh   (only needed once)
#       ./exercises/01_count_muons.sh
# ==============================================================================

# Find the data folder relative to where this script lives, so the script works
# no matter which folder you start it from. $0 is the path of this script.
DATA_DIR="$(dirname "$0")/../data"

# grep ",muon," keeps only the lines that contain the word muon between commas.
# The pipe | sends those lines to wc -l, which counts the lines.
N_MUONS=$(grep ",muon," "$DATA_DIR/events.csv" | wc -l)

# Count ALL events too. The file has 1 header line, so we subtract 1.
N_LINES=$(wc -l < "$DATA_DIR/events.csv")
N_EVENTS=$((N_LINES - 1))

echo "Total events : $N_EVENTS"
echo "Muons        : $N_MUONS"
