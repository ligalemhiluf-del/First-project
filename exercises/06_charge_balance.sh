#!/bin/bash
# ==============================================================================
# Exercise 6: count positive, negative and neutral particles
# Practices: cut, sort, uniq -c, pipes
#
# Run:  ./exercises/06_charge_balance.sh
# ==============================================================================

DATA_DIR="$(dirname "$0")/../data"

echo "Number of particles for each charge (charge value on the right):"

# tail -n +2  : skip the header
# cut -d, -f5 : keep only column 5 (charge)
# sort        : uniq only joins identical lines that are next to each other
# uniq -c     : count how many times each value appears
tail -n +2 "$DATA_DIR/events.csv" | cut -d, -f5 | sort | uniq -c
