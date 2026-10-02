#!/bin/bash
# ==============================================================================
# Exercise 4: statistics for one particle type, given as an argument ($1)
# Practices: $1, $#, if, grep, sort, head, tail, wc
#
# Run:  ./exercises/04_particle_stats.sh muon
#       ./exercises/04_particle_stats.sh photon
# Particles in the data: muon electron photon pion kaon proton
# ==============================================================================

# 1. Safety check, like in create_structure3.sh:
#    $# is the number of arguments. If it is less than 1, show a usage message.
if [ $# -lt 1 ]; then
    echo "Error: missing particle name."
    echo "Usage: $0 <particle>"
    echo "Example: $0 muon"
    exit 1
fi

PARTICLE="$1"
DATA_DIR="$(dirname "$0")/../data"

# 2. Keep only the lines of this particle. The quotes protect odd names.
#    We save them in a variable so we can reuse them below.
LINES=$(grep ",$PARTICLE," "$DATA_DIR/events.csv")

# 3. If grep found nothing, tell the user and stop.
if [ -z "$LINES" ]; then
    echo "No '$PARTICLE' found in events.csv"
    exit 1
fi

# 4. Count the lines. echo "$LINES" prints them, wc -l counts them.
COUNT=$(echo "$LINES" | wc -l)

# 5. Energies are in column 4. cut -d, -f4 picks that column.
#    sort -n sorts numerically: first line = lowest, last line = highest.
ENERGIES=$(echo "$LINES" | cut -d, -f4 | sort -n)
MIN=$(echo "$ENERGIES" | head -n 1)
MAX=$(echo "$ENERGIES" | tail -n 1)

# 6. The mean needs a little arithmetic. awk adds up all numbers and divides.
MEAN=$(echo "$ENERGIES" | awk '{ sum += $1 } END { printf "%.2f", sum / NR }')

echo "Statistics for: $PARTICLE"
echo "  Count       : $COUNT"
echo "  Min energy  : $MIN GeV"
echo "  Max energy  : $MAX GeV"
echo "  Mean energy : $MEAN GeV"
