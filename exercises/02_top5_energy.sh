#!/bin/bash
# ==============================================================================
# Exercise 2: find the 5 highest-energy particles
# Practices: tail, sort, head, pipes
#
# Run:  ./exercises/02_top5_energy.sh
# ==============================================================================

DATA_DIR="$(dirname "$0")/../data"

echo "The 5 highest-energy particles (event_id,run,particle,energy_GeV,charge):"

# tail -n +2  : start from line 2, so the header line is skipped
# sort -t, -k4 -n -r :
#     -t,   the columns are separated by commas
#     -k4   sort using column 4 (energy_GeV)
#     -n    compare as NUMBERS (not as text)
#     -r    reverse: biggest first
# head -n 5   : keep only the first 5 lines
tail -n +2 "$DATA_DIR/events.csv" | sort -t, -k4 -n -r | head -n 5
