# Lesson 5 – Loops

## The idea
A **loop** repeats commands for every item in a list.
```bash
for thing in list_of_things
do
    operation_using $thing
done
```
`thing` is the **loop variable**; you read its value with `$thing`.

## Examples
Count from 0 to 4:
```bash
for n in 0 1 2 3 4
do
    echo $n
done
```
```
0
1
2
3
4
```
Loop over files with a wildcard:
```bash
for file in data/run_*.csv
do
    echo $file
    wc -l $file
done
```
```
data/run_001.csv
68 data/run_001.csv
data/run_002.csv
68 data/run_002.csv
data/run_003.csv
67 data/run_003.csv
```
Make a backup copy of every file (like the lecture's `cp $file raw-$file`):
```bash
for file in data/run_*.csv
do
    cp $file raw-$(basename $file)
done
```
You can also write a loop on one line: `for f in *.csv; do echo $f; done`.

Tip from the lecture: first use `echo` to *see* what the loop would do, and only
then run the real command.

## Try it yourself
Loop over the three run files and print, for each, the **highest energy** in it.
(Hint: `cut`, `sort -n`, `tail -n 1`.)

<details>
<summary>Solution</summary>

```bash
for file in data/run_*.csv
do
    echo -n "$file: "
    tail -n +2 $file | cut -d, -f4 | sort -n | tail -n 1
done
```
Output:
```
data/run_001.csv: 177.27
data/run_002.csv: 120.42
data/run_003.csv: 221.74
```
</details>

Next: [Lesson 6 – Scripts and arguments](06-scripts-and-arguments.md)
