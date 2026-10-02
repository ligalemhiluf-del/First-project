# Lesson 3 – Files and folders

(Lecture exercises n.1 and n.2.)

## Commands
| Command | Meaning |
|---------|---------|
| `mkdir name` | make a directory |
| `touch file` | create an empty file |
| `nano file` | edit a file in the simple `nano` editor (Ctrl+O save, Enter, Ctrl+X exit) |
| `cat file` / `more file` | show the content of a file |
| `cp a b` | copy `a` to `b` |
| `cp -r dir1 dir2` | copy a whole directory (**r**ecursive) |
| `mv a b` | move **or rename** `a` |
| `rm file` | delete a file (**no recycle bin!**) |
| `rm -r dir` | delete a directory and everything inside |

**Good names:** no spaces and no special characters. Use `my_data.csv`, not `my data!.csv`.

## Example
```bash
mkdir lab2526
cd lab2526
touch test2
ls
```
```
test2
```
```bash
cp test2 test3
mkdir old
mv test3 old/        # move test3 into old
ls
```
```
old  test2
```
```bash
mv test2 old/test22  # move AND rename
ls old
```
```
test22  test3
```
(`test3` was moved into `old` a moment ago, so both files are there.)
`rm old` fails ("Is a directory"), but `rm -r old` works.

## Wildcard `*`
`*` means "anything". Instead of three names you can write:
```bash
cp basilisk.dat unicorn.dat minotaur.dat prova     # long way
cp *dat prova                                      # short way
```
Careful: `cp` with several files needs a **directory** as the last argument.

## Try it yourself
Inside the project folder:
1. Make a folder `practice`.
2. Copy all `run_*.csv` files from `data/` into it using a wildcard.
3. Rename `run_001.csv` inside `practice` to `first.csv`.
4. List the folder, then delete the whole `practice` folder.

<details>
<summary>Solution</summary>

```bash
mkdir practice
cp data/run_*.csv practice
mv practice/run_001.csv practice/first.csv
ls practice
```
```
first.csv  run_002.csv  run_003.csv
```
```bash
rm -r practice
```
</details>

Next: [Lesson 4 – Pipes and redirection](04-pipes-and-redirection.md)
