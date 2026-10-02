#!/bin/bash
# ==============================================================================
# Exercise 5: split events.csv into one file per particle type
# Practices: mkdir -p, for-loop over a list, redirection > and >>
#
# Run:  ./exercises/05_split_by_particle.sh
# Result: a new folder "output/" with muon.csv, electron.csv, ...
# ==============================================================================

DATA_DIR="$(dirname "$0")/../data"
OUT_DIR="output"

# -p: no error if the folder already exists.
mkdir -p "$OUT_DIR"

# Loop over a list of names written directly in the script.
for particle in muon electron photon pion kaon proton
do
    # '>' creates the file (or empties it if it exists).
    # We start every file with the header line (first line of events.csv).
    head -n 1 "$DATA_DIR/events.csv" > "$OUT_DIR/$particle.csv"

    # '>>' ADDS to the end of the file instead of replacing it.
    grep ",$particle," "$DATA_DIR/events.csv" >> "$OUT_DIR/$particle.csv"

    echo "$particle: $(( $(wc -l < "$OUT_DIR/$particle.csv") - 1 )) events -> $OUT_DIR/$particle.csv"
done
