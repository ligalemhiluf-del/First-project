# Lesson 4 – Pipes and redirection

(Lecture exercise n.3.)

## Ideas
- **Pipe `|`**: the output of the command on the left becomes the input of the
  command on the right.
- **`>`** sends output into a file (**replaces** the file).
- **`>>`** sends output into a file (**adds** to the end).

## Useful commands
| Command | What it does |
|---------|--------------|
| `head -n 5 f` | first 5 lines |
| `tail -n 3 f` | last 3 lines (`tail -n +2 f` = everything from line 2) |
| `sort f` | sort lines (`-n` numbers, `-r` reverse, `-t, -k4` column 4 of a CSV) |
| `wc f` | lines, words, characters |
| `wc -l f` | only the number of lines |
| `grep text f` | only lines that contain `text` |
| `cut -d, -f3 f` | column 3 of a comma-separated file |

## Examples on our data
```bash
head -n 3 data/events.csv
```
```
event_id,run,particle,energy_GeV,charge
1,1,kaon,7.23,-1
2,1,muon,31.58,1
```
```bash
grep ",muon," data/events.csv | wc -l
```
```
51
```
Highest energy first (skip the header with `tail -n +2`):
```bash
tail -n +2 data/events.csv | sort -t, -k4 -n -r | head -n 2
```
```
188,3,muon,221.74,-1
14,1,photon,177.27,0
```

### The lecture's long pipe
```bash
cat animals.csv | head -n 5 | tail -n 3 | sort -r > final.txt
```
`head` takes the first 5 lines, `tail` keeps the last 3 of those, `sort -r` reverses
the order, and `>` writes the result to `final.txt`. Tip: build a pipe **one
command at a time** and look at each result.

### Redirection
```bash
wc -l data/events.csv > count.txt      # creates/replaces count.txt
wc -l data/run_001.csv >> count.txt    # adds a second line
cat count.txt
```
```
201 data/events.csv
68 data/run_001.csv
```

## Try it yourself
Write one command that saves the **3 lowest** energies (only the numbers) of
`data/events.csv` into `lowest.txt`.

<details>
<summary>Solution</summary>

```bash
tail -n +2 data/events.csv | cut -d, -f4 | sort -n | head -n 3 > lowest.txt
cat lowest.txt
```
`tail -n +2` removes the header, `cut -d, -f4` keeps the energy column,
`sort -n` sorts from low to high, `head -n 3` keeps three, `>` saves them.
</details>

Next: [Lesson 5 – Loops](05-loops.md)
