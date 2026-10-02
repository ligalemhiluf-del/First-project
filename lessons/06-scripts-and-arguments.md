# Lesson 6 – Scripts and arguments

## What is a script?
A **script** is a text file with shell commands. Bash reads it line by line and runs
each command, as if you typed them. The first line `#!/bin/bash` (the "shebang")
says: "run this file with bash". Lines starting with `#` are **comments**: bash
ignores them, they are notes for humans.

## Two ways to run a script
```bash
chmod +x myscript.sh     # once: give permission to execute
./myscript.sh            # Method 1: runs in a NEW bash process
source myscript.sh       # Method 2: runs INSIDE your current shell (same as: . myscript.sh)
bash myscript.sh         # also works, without chmod
```
The lecture example:
```bash
#!/usr/bin/env bash
export A="hello world"
echo $A
```
- `./test.sh` prints `hello world`, but afterwards `echo $A` prints **nothing**:
  the variable lived only in the child process.
- `source test.sh` (or `. test.sh`) changes **your current shell**, so afterwards
  `echo $A` prints `hello world`. Use `source` when a script must set variables or
  `cd` for you.

⚠️ Careful: `exit` inside a script that you `source` closes **your terminal**,
because the script *is* your shell. Scripts with `exit` should be run with `./`.

## Arguments: `$1`, `$2`, `$@`, `$#`, `$0`
Words you type after the script name are its **arguments**:
```bash
./09-arguments.sh panda swan banana
```
| Symbol | Meaning | Value above |
|--------|---------|-------------|
| `$0` | name of the script | `./09-arguments.sh` |
| `$1` | first argument | `panda` |
| `$2` | second argument | `swan` |
| `$3` | third argument | `banana` |
| `$@` | **all** arguments, as separate words | `panda swan banana` |
| `$#` | **how many** arguments | `3` |

## Your script `09-arguments.sh`, step by step
```bash
#!/bin/bash
```
Run with bash.
```bash
echo "
#####...
"
```
One `echo` with a long text in double quotes spanning several lines: it prints the
banner box (the help text for the user).
```bash
echo '$1 is' $1
```
Two parts: `'$1 is'` is in **single quotes**, so it is printed literally as the
text `$1 is`. The second part, `$1`, is **not** quoted, so bash replaces it with the
first argument. Result: `$1 is panda`. (Same for `$2` and `$3`.)
```bash
for i in "$@"
do
    echo $i
done
```
A loop (lesson 5). `"$@"` expands to one item per argument, so `i` becomes `panda`,
then `swan`, then `banana`, and each is printed. Quoting `"$@"` keeps an argument with
spaces (like `"big cat"`) as **one** item.

Output of `./09-arguments.sh panda swan banana` (after the banner):
```
$1 is panda
$2 is swan
$3 is banana
printing out all the arguments now:
panda
swan
banana
```

## `create_structure1.sh` – fixed names
```bash
DIR_NAME="my_subdirectory"        # a variable (no spaces around =)
FILE_NAME="empty_file.txt"
mkdir -p "$DIR_NAME"              # -p: no error if it already exists
touch "$DIR_NAME/$FILE_NAME"      # empty file inside the folder
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully!"
```
It always creates the same folder and file. The `echo` uses **double quotes**, so
`$DIR_NAME` is replaced by its value; the single quotes inside are just text.

## `create_structure2.sh` – names from arguments
```bash
DIR_NAME="$1"
FILE_NAME="$2"
```
Now you choose the names: `./create_structure2.sh my_folder my_file.txt`.
**Problem:** if you forget an argument, nothing stops the script. With
`./create_structure2.sh my_folder` the variable `$2` is empty, so `touch "my_folder/"`
does nothing useful, yet the script still says "created successfully!" (we tested
this). With no arguments at all, `mkdir -p ""` prints an error, **and the script still prints "created successfully!"** (we tested this too).

## `create_structure3.sh` – the safest version
```bash
if [ $# -lt 2 ]; then
    echo "Error: Missing arguments."
    echo "Usage: $0 <directory_name> <file_name>"
    exit 1
fi
```
- `$#` is the number of arguments; `-lt 2` means "less than 2".
- If fewer than two arguments were given, it prints an error plus a **usage
  message** (`$0` is the script's own name), then `exit 1` stops the script. Exit code
  `1` means "something went wrong" (`0` means success).
- Only if both arguments exist does it continue to create the folder and file.

Why it is the safest:
1. It **checks the input first**, so it never does half the job or lies with a
   fake "success" message.
2. It tells the user **how to use it**.
3. It returns a proper **exit code**, so other scripts can detect failure
   (`./create_structure3.sh || echo failed`).
4. Every variable is written in **double quotes** (`"$DIR_NAME"`), so a name with a
   space such as `"my file.txt"` still works.

## Try it yourself
Run `scripts/original/create_structure3.sh` three times: (a) with no arguments,
(b) with `results` and `"my notes.txt"`, (c) check afterwards with `ls results`
and `echo $?` right after (a).

<details>
<summary>Solution</summary>

```bash
./scripts/original/create_structure3.sh
```
```
Error: Missing arguments.
Usage: ./scripts/original/create_structure3.sh <directory_name> <file_name>
```
```bash
echo $?       # prints 1 (the exit code of the failed run)
./scripts/original/create_structure3.sh results "my notes.txt"
ls results
```
```
Directory 'results' and file 'my notes.txt' created successfully!
my notes.txt
```
Clean up with `rm -r results`.
(Note: `echo $?` shows the exit code of the **last** command, so run it directly after (a).)
</details>

Now see the new scripts in `exercises/` – especially `04_particle_stats.sh`, which
uses the same usage-message idea on physics data.

Next: [Lesson 7 – ATLAS and the Higgs boson](07-atlas-and-higgs.md)
