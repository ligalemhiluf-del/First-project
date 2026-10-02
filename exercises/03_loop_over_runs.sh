#!/bin/bash
# ==============================================================================
# Exercise 3: loop over all run files
# Practices: for-loop, wildcard *, wc -l
#
# Run:  ./exercises/03_loop_over_runs.sh
# ==============================================================================

DATA_DIR="$(dirname "$0")/../data"

TOTAL=0

# run_*.csv is a wildcard: it matches run_001.csv, run_002.csv, run_003.csv.
# The loop repeats the commands between do ... done once for each file.
for file in "$DATA_DIR"/run_*.csv
do
    # Number of lines minus 1 (the header line) = number of events.
    n_lines=$(wc -l < "$file")
    n_events=$((n_lines - 1))

    # Count the muons in this run.
    n_muons=$(grep -c ",muon," "$file")

    echo "$(basename "$file"): $n_events events, $n_muons muons"

    # Add this run's events to the running total.
    TOTAL=$((TOTAL + n_events))
done

echo "All runs together: $TOTAL events"
