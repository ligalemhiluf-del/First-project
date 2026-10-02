# HEP Shell Lab

A small learning project for a beginner physics student. It teaches the **Linux
shell (bash)** using examples from **High Energy Physics**, based on lecture 1 of
the HEP data-analysis course (operating systems, shell commands, ATLAS, the Higgs
boson).

You get: 7 short lessons, practice data, practice scripts, and a web page with a
Higgs decay chart, an ATLAS detector diagram and a 10-question quiz.

## Folder structure

```
.
├── index.html            the website (open it in a browser)
├── README.md             this file
├── lecture/
│   └── lecture1.pdf      the original lecture slides
├── lessons/              7 lessons in Markdown (01 ... 07)
├── scripts/
│   └── original/         your original scripts (09-arguments.sh, create_structure1/2/3.sh)
├── data/                 SIMULATED practice data (not real ATLAS data)
│   ├── events.csv        200 collision events: event_id,run,particle,energy_GeV,charge
│   ├── run_001.csv       the same events split into 3 runs (for loop exercises)
│   ├── run_002.csv
│   ├── run_003.csv
│   ├── higgs_decays.csv  Higgs branching ratios from the lecture
│   └── make_data.py      the program that generated the data (optional)
└── exercises/            new scripts that practice the lecture's commands on the data
```

## How to use (step by step)

### 1. Open a terminal
- **Ubuntu / Linux:** press `Ctrl+Alt+T`, or search for "Terminal".
- **Mac:** press `Cmd+Space`, type "Terminal", press Enter.
- **Windows:** install WSL once: open PowerShell as administrator, run
  `wsl --install`, restart, then open "Ubuntu" from the Start menu.
  (WSL gives you a real Ubuntu shell inside Windows.)

### 2. Get the project and go into it
```bash
git clone https://github.com/ligalemhiluf-del/first-project.git
cd first-project
ls
```
You should see `index.html`, `lessons`, `data`, ... Always run commands from this
folder (check with `pwd`).

### 3. Follow the lessons in order
1. `lessons/01-what-is-an-os.md`
2. `lessons/02-shell-basics.md`
3. `lessons/03-files-and-folders.md`
4. `lessons/04-pipes-and-redirection.md`
5. `lessons/05-loops.md`
6. `lessons/06-scripts-and-arguments.md`
7. `lessons/07-atlas-and-higgs.md`

Read a lesson with `cat lessons/02-shell-basics.md` (or open it on GitHub or in an
editor). Try the exercise *before* opening the solution under "Solution".

### 4. Run scripts: `chmod +x`, `./` and `source`
A script needs permission to be executed. Give it once:
```bash
chmod +x exercises/01_count_muons.sh
```
Then run it in one of two ways:
```bash
./exercises/01_count_muons.sh        # runs in a NEW process (normal way)
source scripts/original/create_structure3.sh myfolder myfile.txt   # runs in YOUR shell
```
- `./script.sh` – variables the script sets disappear when it ends.
- `source script.sh` (same as `. script.sh`) – the script changes your current
  shell, so variables stay. Careful: if a sourced script calls `exit` (like
  `create_structure3.sh` on missing arguments), your terminal closes. Use `./` for those.
- `bash script.sh` also works without `chmod`.

Give all scripts permission at once: `chmod +x exercises/*.sh scripts/original/*.sh`

### 5. Try the exercises
```bash
./exercises/01_count_muons.sh
./exercises/02_top5_energy.sh
./exercises/03_loop_over_runs.sh
./exercises/04_particle_stats.sh muon       # needs a particle name
./exercises/04_particle_stats.sh            # shows the usage message
./exercises/05_split_by_particle.sh         # creates a folder called output/
./exercises/06_charge_balance.sh
```
Open each script with `nano` or `cat` and read the comments. Then change it!

### 6. Open the website
- Mac: `open index.html`   Ubuntu: `xdg-open index.html`
- Windows/WSL: `explorer.exe index.html`
- Or just double-click `index.html` in your file manager.

It has the lessons list, an interactive Higgs decay chart, the ATLAS layer
diagram (inner detector → calorimeters → muon chambers) and the quiz. No internet
or installation needed.

## About the data
`data/` is **simulated** for practice. Particles: muon, electron, photon, pion,
kaon, proton. The Higgs numbers (production ggF 88 %, VBF 7 %, VH 4 %, ttH 1 %;
decays bb 58.4 %, WW 21.4 %, gg 8.2 %, ττ 6.3 %, cc 2.9 %, ZZ 2.6 %, γγ 0.2 %) come
from the lecture slides. To recreate the data: `python3 data/make_data.py`.

Shell examples in the lecture are from the Software Carpentry shell lesson
(<https://swcarpentry.github.io/shell-novice/>).
