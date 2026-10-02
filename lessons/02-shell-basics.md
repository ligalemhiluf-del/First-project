# Lesson 2 – Shell basics

## The idea
The **shell** is a text window where you talk to your computer. There are several
shells (`sh`, `csh`, `tcsh`, `zsh`, **`bash`**). In this course we use **bash**.
Commands like `ls` are just small programs (look in `/bin`: `/bin/ls`, `/bin/pwd`).

## Commands to learn
| Command | Meaning |
|---------|---------|
| `pwd` | **p**rint **w**orking **d**irectory – where am I? |
| `ls` | **l**i**s**t the files in the folder |
| `ls -l` | long list (permissions, size, date) |
| `ls -la` | also show hidden files (names starting with `.`) |
| `ls -latr` | long, all, sorted by time, oldest first (the lecturer's favourite) |
| `man ls` | manual page of `ls` (press `q` to quit). Also: `ls --help` |
| `clear` | clean the screen |
| `history` | list the commands you typed before |
| `cd folder` | **c**hange **d**irectory |

Tip: press **Tab** to auto-complete a name. Press the up arrow to repeat an old command.

## Example
```bash
pwd
```
```
/home/anna
```
```bash
ls -l
```
```
total 8
drwxr-xr-x 2 anna anna 4096 Oct  2 10:00 Documents
-rw-r--r-- 1 anna anna   12 Oct  2 10:05 notes.txt
```
(Your output will differ. `d` at the start means a directory.)

## Moving around
```bash
cd ..        # go UP one folder
cd -         # go BACK to the previous folder
cd ~         # go to your home folder (~ means "my home")
cd /         # go to the root of the whole system
cd           # with nothing: also go home
```
The lecture says: *`cd ..` brings you up, `cd -` brings you back.*

## Try it yourself
1. Print where you are.
2. Go to `/`, then print where you are.
3. Go home in **one** step and print where you are.

<details>
<summary>Solution</summary>

```bash
pwd
cd /
pwd        # prints /
cd ~       # or just: cd
pwd        # prints your home, e.g. /home/anna
```
</details>

Next: [Lesson 3 – Files and folders](03-files-and-folders.md)
