# Automation

Automation in software development is the use of technology to automate tasks that would otherwise be performed manually. This can include tasks such as code generation, code review, and testing

## Shell Script {talk to the operating system}

Shell scripting in DevOps refers to the practice of writing scripts using shell languages (such as , PowerShell, or other scripting languages) to automate and streamline various tasks in the DevOps process.

Shell scripts play a crucial role in DevOps by allowing automation of repetitive tasks, configuration management, deployment, and other activities involved in the software development lifecycle

\*!NOTE: server don't have graphical interface, like our personal laptops, so to interact with the operating system of the server we use scripting.

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

System Information:
uname: Display system information.
`uname -a`

df: Display disk space usage.
`df -h`

free: Display free and used memory.
`free -h`

cpu info
nproc: Number of processes

IMP: ----> top: can use 'top', give all the info of the system
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

# CMD to work with .sh files

1. extension should be .sh or .py(for python scripts)
2. vim or vi for open file for edit
3. first line should be #!/bin/[...bash/sh] : this is called shebang bash/sh/dash/ksh/... are some of the executable of linux machine, so before executing a sh file, we need to tell the linux machine where which executable we are using. [they have some syntax differences]
   \*bash is important

earlier !#/bin/sh -----------link to --> !/bin/bash, but with some of the ubuntu system, !/bin/sh it is directed to !/bin/dash. so the file need to mention proper syntax.

# Important CMD

q: to quit the terminal
echo: to print anything on the terminal.
q!: to close the file
wq!: to save file
cat: to open the file in read mode

awk : filter out he out of grep cmd

# To execute a script -

-- ./ <file_name> : it can be used to execute any script like sh or python
-- sh <file_name> : to execute sh script

# permission

-- chmod 777(grant access to every one) <file_name>

[777] (7 for myself/owner, 7 for my group, 7 for everyone)

In Linux 7 is 4,2, 1 : read, write executes.

-- chmod 600
The command chmod 600 is a Unix/Linux command used to change the permissions of a file. In this case, chmod stands for "change mode," and 600 is a numeric representation of the permissions being set.

Here's what each part means:

chmod: The command used to change file permissions.

600: This is the permission setting. In Unix/Linux systems, permissions are represented by three digits, each representing the permissions for different groups of users: owner, group, and others. In this case, 600 specifically refers to the owner's permissions.

Breaking down 600:

The first digit (6) represents the permissions for the owner.
The second and third digits (00) represent the permissions for the group and others, respectively.
The numbers in the permissions represent the following:

6 represents read and write permissions.
0 represents no permissions.
So, chmod 600 sets the file permissions to read and write (but not execute) for the owner, and no permissions for the group and others.

---

man: it is a manual command

---

# Advance Script Commands

Echo is used to print information on the command line, and also for debugging.. with number of commands increases that become impossible to have a echo statement before every command. same can be achieved by running the script in debug mode, it will print the command line information.

`set -x` #debug mode

## <!-- add details section in the script, with author, version, date -->

Process Management:
ps: Display information about processes.
`ps aux`
`ps -ef`

kill: Terminate a process.
`kill -9 process_id`

\*IMP: top or htop: Display real-time system statistics and process information.

- filtering the process
  `ps -ef | grep <process_name>`

  : grep command fetch information only about the asked process
  : '|' , pipe command, send the output of the first command to the second command

## trap

The trap command traps a system-generated signal generated by the D3 monitor or by the UNIX kernel and executes a TCL statement. Without any argument, the trap command lists the currently global signals.

trap "echo do not use the control command" SIGINT

## awk

it is powerful , scanning and processing languages.
say if we want to see the process id,
`ps -ef | grep <process_name>`, it will print the processes

to get the specific process, as processes on terminal are string with alot of information, to get that specific process we need to awk.

example
ps -ef | grep 'amazon' | awk -F" " '{ print $2}'

NOTE: while using pipe, we need to 2 things in our script

`set -x` # debug mode
`set -e` # it exists the script and when there in a error,
`set -o pipefail` # drawback of set -e, it will not fail for the pipe, so we need to set -o pipefail.

all the error or debug check can be put in single line
`set -exo pipefail`

## curl command

Client URL (cURL, pronounced “curl”) is a command line tool that enables data exchange between a device and a server through a terminal.
It retrieve the information from the internet.

`curl <url> | grep <filter_value>`

## find command

## Interview Question

1. date | echo "today is"
   -> output: today is

date is default command, it send the output stdin, so pipe doesn't redirect output to second command.

2. wget vs curl
   wget download the file and do operation, curl don't download the file.
