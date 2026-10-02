# Lesson 7 – ATLAS and the Higgs boson

## Why a shell course in particle physics?
In HEP we analyse data from experiments to measure properties of elementary
particles, and to search for new particles or unexpected behaviour. The data are
big, so we use Unix tools, scripts, and later ROOT, Monte Carlo simulation and fits.

## The ATLAS detector
ATLAS is "a perfect example of a particle physics detector": 44 m long, 22 m in
diameter, about 7000 tonnes (numbers on the lecture slide). Layers from the
collision point outwards:

1. **Inner Detector** – tracks of charged particles (they bend in the magnetic field of the solenoid).
2. **Electromagnetic calorimeters** – measure energy of electrons and photons.
3. **Hadronic calorimeters** – measure energy of hadrons (pions, protons…).
4. **Muon detectors (muon chambers)** – outermost; muons pass through everything else.

The slide also names the solenoid, the barrel and end-cap toroids, the forward
calorimeters and the shielding. See the diagram in `index.html`.

## The Higgs boson
Our lecture asks: *do you remember the discovery of the Higgs boson?* The plots show
a small bump at about **125 GeV** in the channels H→γγ, H→ZZ→4ℓ and H→WW.

**How a Higgs is produced at the LHC** (slide):
| Mode | Share |
|------|-------|
| ggF (gluon–gluon fusion) | 88 % |
| VBF (vector boson fusion) | 7 % |
| VH (with a W or Z) | 4 % |
| ttH (with a top–antitop pair) | 1 % |

**How a Higgs decays** (branching ratios, slide):
| Decay | Share |
|-------|-------|
| bb | 58.4 % |
| WW | 21.4 % |
| gg | 8.2 % |
| ττ | 6.3 % |
| cc | 2.9 % |
| ZZ | 2.6 % |
| γγ | 0.2 % |

(The slide also shows a tiny slice for μμ, Zγ and others; it is too small to read, so it
is not in our CSV.) The same numbers are in `data/higgs_decays.csv`.

Interesting: H→γγ is only 0.2 %, but photons are easy to measure precisely, so it
is one of the "discovery channels".

> "A plot is not a drawing but is the synthesis of a work, and must communicate
> precisely the result obtained." (lecture)

## Try it with the shell
Show the decays sorted from the most to the least likely, and find the sum of all
percentages.

<details>
<summary>Solution</summary>

```bash
tail -n +2 data/higgs_decays.csv | sort -t, -k3 -n -r
```
```
bb,bottom quarks,58.4
WW,W bosons,21.4
gg,gluons,8.2
tautau,tau leptons,6.3
cc,charm quarks,2.9
ZZ,Z bosons,2.6
gammagamma,photons,0.2
```
Sum with `awk`:
```bash
tail -n +2 data/higgs_decays.csv | cut -d, -f3 | awk '{s += $1} END {print s}'
```
```
100
```
</details>

You finished the lessons. Do the quiz in `index.html`!
