# Lesson 1 – What is an operating system?

*Based on lecture 1 (slides on OS, Unix, Linux, Ubuntu).*

## The idea in simple words

An **operating system (OS)** is the main program of a computer. It manages the
hardware (CPU, memory, disk, keyboard, screen) and gives services to all other
programs. Your programs never talk to the hardware directly – they always ask
the OS.

Examples: Windows, macOS, iOS, Android, **Linux** (for example **Ubuntu**), Unix.

### Main parts of an OS
| Part | What it does |
|------|--------------|
| **Kernel** | The core. Controls the hardware, gives memory (RAM) to programs, decides which program uses the CPU, organizes files on disk. |
| **I/O and networking** | Input/output devices and internet connections. |
| **User interface** | How *you* talk to the computer. Two kinds: the **GUI** (windows, icons, mouse) and the **command line** (you type commands). The command-line program is called the **shell**. |

## A little history (from the lecture)
- **Unix** was created in 1969 at AT&T Bell Labs (Thompson, Ritchie, McIlroy, Ossanna).
  First released 1971. In 1973 it was rewritten in the language **C**.
- **Linux** is a free, open-source, Unix-like OS (1991, Linus Torvalds).
- **Ubuntu** is the most popular Linux distribution on desktop and laptop PCs. It is
  based on Debian and is free.
- **GNU** is a big collection of free software. GNU tools + the Linux kernel = what
  people call "Linux".

## Why do physicists use Linux?
Unix-like systems are the most used in High Energy Physics (HEP). Macs are
Unix-like too. On Windows you can use **WSL** (Windows Subsystem for Linux) or a
Linux virtual machine. The lecture suggests **Ubuntu** for everybody except Mac users.

## Compiler vs interpreter
- A **compiler** (e.g. for C++) translates the whole program *before* it runs.
- The **shell is an interpreter**: it translates and runs your commands *line by line*.

## Try it yourself
Open a terminal and type:
```bash
uname -a
```
Question: what word do you see at the start of the output, and what does it tell you?

<details>
<summary>Solution</summary>

On Ubuntu or WSL you will see something like:
```
Linux mycomputer 5.15.0 ... x86_64 GNU/Linux
```
The first word, `Linux`, is the name of the kernel. On a Mac you will see `Darwin`
(also Unix-like).
</details>

Next: [Lesson 2 – Shell basics](02-shell-basics.md)
