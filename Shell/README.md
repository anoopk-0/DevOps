# Automation

Automation in software development is the use of technology to automate tasks that would otherwise be performed manually. This can include tasks such as code generation, code review, and testing

## Shell Script

Shell scripting in DevOps refers to the practice of writing scripts using shell languages (such as , PowerShell, or other scripting languages) to automate and streamline various tasks in the DevOps process.

Shell scripts play a crucial role in DevOps by allowing automation of repetitive tasks, configuration management, deployment, and other activities involved in the software development lifecycle

## Here are some basic shell commands that you might find useful:

[linux] machine does not graphical user interface.

\*\*men <cmd>: give information about the command

Navigation:
cd: Change directory.
`cd /path/to/directory`
pwd: Print working directory.
`pwd`
ls: List files and directories.
`ls`
ls -ltr: files with timestamps
`ls -ltr`

---

File Operations:
cp: Copy files or directories.
`cp source destination`
mv: Move or rename files or directories.
`mv source destination`
rm: Remove files or directories.
`rm file`

---

File Viewing and Editing:
cat: Concatenate and display the content of files.  
 `cat filename`
nano or vim: Text editors for creating or modifying files.
`nano filename`

---

Working with Directories:
mkdir: Create a new directory.
`mkdir directoryname`
rmdir: Remove an empty directory.
`rmdir directoryname`

---

Searching:
grep: Search for a pattern in files.
`grep pattern filename`
find: Search for files and directories.
`find /path/to/search -name filename`

---

Process Management:
ps: Display information about processes.
`ps aux`
kill: Terminate a process.
`kill process_id`
\*top or htop: Display real-time system statistics and process information.

---

System Information:
uname: Display system information.
`uname -a`
df: Display disk space usage.
`df -h`
free: Display free and used memory.
`free -h`
cpu info
nproc: Number of processes
top: can use 'top', give all the info of the system
\*\* `[df|nproc|free|top]`

---

Permissions:
chmod: Change file permissions.
`chmod permissions filename`

chown: Change file owner and group.
`chown owner:group filename`

---

Network:
ping: Check network connectivity to a host.
`ping hostname`
ifconfig or ip: Display network interfaces and configuration.
`ifconfig`

---

Archive and Compression:
tar: Create or extract tar archives.
`tar -cvf archive.tar files`
`tar -xvf archive.tar`
gzip or gunzip: Compress or decompress files.
`gzip filename`

## CMD to work with .sh files

1. extension should be .sh or .py(for python scripts)
2. vim or vi for open file for edit
3. first line should be #!/bin/[...bash/sh] : this is called shebang bash/sh/dash/ksh/... are some of the executable of linux machine, so before executing a sh file, we need to tell the linux machine where which executable we are using. [they have some syntax differences]
   \*bash is important

earlier !#/bin/sh -----------link to --> !/bin/bash, but with some of the ubuntu system, !/bin/sh it is directed to !/bin/dash. so the file need to mention proper syntax.

## Important CMD

q: to quit the terminal
echo: to print anything on the terminal.
q!: to close the file
wq!: to save file
cat: to open the file in read mode

awk : filter out he out of grep cmd

\*\*to execute a script -
-- ./ <file_name> : it can be used to execute any script like sh or python
-- sh <file_name> : to execute sh script

\*\*permission
-- chmod 777(grant access to every one) <file_name>

[777] (7 for myself/owner, 7 for my group, 7 for everyone)

In Linux 7 is 4,2, 1 : read, write executes.
