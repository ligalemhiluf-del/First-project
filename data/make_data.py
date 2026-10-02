#!/usr/bin/env python3
"""Makes the SIMULATED practice data (not real ATLAS data!).
Run it with:  python3 data/make_data.py
It always gives the same numbers because the random seed is fixed."""
import random

random.seed(2526)

# particle name -> (possible charges, typical energy in GeV, relative weight)
PARTICLES = {
    "muon":     ([-1, +1], 45.0, 25),
    "electron": ([-1, +1], 38.0, 25),
    "photon":   ([0],      30.0, 20),
    "pion":     ([-1, +1], 15.0, 15),
    "kaon":     ([-1, +1], 12.0, 8),
    "proton":   ([+1],     20.0, 7),
}
names = list(PARTICLES)
weights = [PARTICLES[n][2] for n in names]

rows = []
for i in range(1, 201):
    run = 1 + (i - 1) * 3 // 200          # 3 runs: events 1-67, 68-134, 135-200
    p = random.choices(names, weights)[0]
    charges, mean, _ = PARTICLES[p]
    energy = round(random.expovariate(1 / mean) + 1.0, 2)   # always > 1 GeV
    rows.append((i, run, p, energy, random.choice(charges)))

HEADER = "event_id,run,particle,energy_GeV,charge\n"

def write(path, subset):
    with open(path, "w") as f:
        f.write(HEADER)
        for r in subset:
            f.write("%d,%d,%s,%.2f,%d\n" % r)

write("data/events.csv", rows)
for run in (1, 2, 3):
    write("data/run_%03d.csv" % run, [r for r in rows if r[1] == run])

# Higgs branching ratios from lecture 1 (they add up to 100 %)
with open("data/higgs_decays.csv", "w") as f:
    f.write("decay,particles,branching_ratio_percent\n")
    for d, p, b in [("bb", "bottom quarks", 58.4), ("WW", "W bosons", 21.4),
                    ("gg", "gluons", 8.2), ("tautau", "tau leptons", 6.3),
                    ("cc", "charm quarks", 2.9), ("ZZ", "Z bosons", 2.6),
                    ("gammagamma", "photons", 0.2)]:
        f.write("%s,%s,%.1f\n" % (d, p, b))
