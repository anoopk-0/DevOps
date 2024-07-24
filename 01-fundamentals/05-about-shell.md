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

ls -ltr: files with timestamps & permission of the files
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

find: Search for files and directories. (this is also important)
`find /path/to/search -name filename`

Ex: find -type f/d -name "f*"
      : f : files
      : d : directory
---

System Information:
uname: Display system information.
`uname -a`

df: Display disk space usage.
`df -h`

free: Display free and used memory.
`free -h`

cpu info
`nproc`: Number of processes

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
3. first line should be #!/bin/[...bash/sh] : this is called shebang /sh/dash/ksh/... are some of the executable of linux machine, so before executing a sh file, we need to tell the linux machine where which executable we are using. [they have some syntax differences]
   \*bash is important

earlier !#/bin/sh -----------link to --> !/bin/bash, but with some of the ubuntu system, !/bin/sh it is directed to !/bin/dash. so the file need to mention proper syntax.

# Important CMD

q: to quit the terminal
echo: to print anything on the terminal.
q!: to close the file
wq!: to save file
cat: to open the file in read mode

!!`awk` : filter out he out of grep cmd

# To execute a script -

-- ./ <file_name> : it can be used to execute any script like sh or python
-- sh <file_name> : to execute sh script


---------

# permission

-- chmod 777(grant access to every one) <file_name>

[777] (7 for myself/owner, 7 for my group, 7 for everyone)

In Linux 7 is 4,2, 1 : read, write, executes.

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

# awk

it is powerful , scanning and processing languages.
say if we want to see the process id,
`ps -ef | grep <process_name>`, it will print the processes

to get the specific process, as processes on terminal are string with alot of information, to get that specific process we need to awk.

example
```bash
ps -ef | grep 'amazon' | awk -F" " '{ print $2}'
```

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

--------

## Interview Question

1. date | echo "today is"
   -> output: today is

date is default command, it send the output stdin, so pipe doesn't redirect output to second command.

2. wget vs curl
   wget download the file and do operation, curl don't download the file.


## Type of package manager

 - npm 
 - apt (Advance package tool)
 - pip
 - yarn

`apt update: in lunix, there is package database, not all the packages are available. so before installing any package in linux, we need to update the package repo, then install the required package.`

!Note: Instead of working with vim to edit, we can use nano package for easily writing the sh.

`-r`: called recursive or -r, it is used for look into/delete a directory
`-i`: to make a search case-insensitive 

`grep -i -r 'hello' /somefolder or -ir`



---------------------------

## chaining commands

In  scripting,  allows you to control the flow of execution based on the success or failure of previous commands. Here's how `&&`, `||`, and `;` work:

1. `&&` (AND operator):
   - Syntax: `command1 && command2`
   - Meaning: `command2` executes only if `command1` succeeds (returns exit status 0).
   - Example:
     ```
     mkdir mydir && cd mydir
     ```
     Here, `cd mydir` will only execute if `mkdir mydir` successfully creates the directory.

2. `||` (OR operator):
   - Syntax: `command1 || command2`
   - Meaning: `command2` executes only if `command1` fails (returns a non-zero exit status).
   - Example:
     ```bash
     rm non_existent_file || echo "File not found"
     ```
     If `rm non_existent_file` fails (because the file doesn't exist), `echo "File not found"` will be executed.

3. `;` (Semicolon):
   - Syntax: `command1 ; command2`
   - Meaning: `command2` is executed regardless of whether `command1` succeeds or fails.
   - Example:
     ```bash
     make ; echo "Build process completed"
     ```
     Here, `echo "Build process completed"` will be executed regardless of whether `make` succeeds or fails.

### Usage Examples:
- Combining `&&` and `||`:
  ```bash
  command1 && command2 || command3
  ```
  - `command2` executes if `command1` succeeds; otherwise, `command3` executes.

- Using semicolons for sequential execution:
  ```
  command1 ; command2 ; command3
  ```
  - `command1`, `command2`, and `command3` are executed sequentially, regardless of the success or failure of each.

### Notes:
- Exit status: Every command in  returns an exit status upon completion (`0` for success, non-zero for failure).
- Grouping commands: You can also use `{}` to group commands and apply operators to the group, like `(command1 && command2) || command3`.

These operators (`&&`, `||`, `;`) provide flexibility in scripting to handle different scenarios based on the success or failure of commands executed in sequence.

-------------------------------------

NOTE: In Bash scripting, the backslash (\) character is primarily used for line continuation, allowing you to split a command across multiple lines for better readability. Here's how you can use it:
```bash
command1 arg1 \
         arg2 \
         arg3

```


-------------------------------------

## Environment Varibles

`printenv` is a straightforward command-line utility that displays all currently defined environment variables and their values in a Unix-like shell environment.

```
# Set an environment variable
export GREETING="Hello, User!"

# Use it in a script
echo $GREETING

```

----------------------------

In the context of shell scripting and command-line usage, `>` and `>>` are both used for directing output, but they have different functionalities:

1. `>` (Redirect Output):
   - The `>` operator is used to redirect the output of a command to a file.
   - If the file already exists, `>` will overwrite the file with the new output.
   - Example:
     ```bash
     echo "Hello, World!" > output.txt
     ```
     This command will write "Hello, World!" to `output.txt`, overwriting its previous contents if it existed.

2. `>>` (Append Output):
   - The `>>` operator is used to redirect the output of a command and append it to the end of a file.
   - If the file exists, `>>` will append the output to the existing content of the file.
   - Example:
     ```bash
     echo "More text" >> output.txt
     ```
     This command will append "More text" to the end of `output.txt`, without erasing its previous content.

Key Differences:
- `>` overwrites the file with new output.
- `>>` appends the output to the end of the file without erasing existing content.
- Both operators are used for output redirection but serve different purposes based on whether you want to replace the file contents (`>`) or add to them (`>>`).

In summary, `>` is for writing to a file and replacing its content, while `>>` is for appending to a file without erasing its current content.

Note: to reaload the .bashrc file, need to do `source .bashrc`, if we added new varible, and without stopping the termial we want to use the variable.

------------

# addUser

`adduser` is a command-line utility in Unix-like operating systems (such as Linux) used to add a new user account. It creates a new user with the specified username and assigns it a home directory and default settings according to the system's configuration.

To use `adduser`, typically you would open a terminal and run:

```bash
sudo adduser username
```

Replace `username` with the desired username for the new account. The `sudo` command is used to execute `adduser` with superuser (administrative) privileges because creating new users usually requires administrative rights.

After running the command, `adduser` will prompt you to set a password for the new user and provide some optional information like full name, phone number, etc. This information is not mandatory and can be skipped by pressing Enter if not needed.

Once the process is complete, the new user account will be created on the system.

-----

In Unix-like operating systems, there are several types of users that can be distinguished based on their permissions and roles. Here are the common types of users:

1. **Regular User**: Also known as a normal user or standard user, this type of user typically has limited privileges and permissions on the system. Regular users can execute programs, access their own files and directories, and perform most day-to-day tasks. They usually do not have administrative privileges.

2. **Superuser (root)**: The superuser, often referred to as `root`, is the administrative user with complete control over the system. Root has unrestricted access to all files and commands, and can perform any operation on the system, including system-wide changes and configurations. Root is crucial for system administration tasks but should be used carefully due to the potential for unintentional damage.

3. **System Users**: These are special-purpose accounts used by the system or applications for specific tasks. They typically do not represent human users and may have restricted permissions tailored to their specific function. Examples include users created for running services like web servers (`www-data` on some systems) or databases (`mysql` or `postgres`).


----

In Unix-like operating systems, user-related information is typically stored in several files and directories within the system. Here are the key locations where user information is stored:

1. `/etc/passwd`: This file contains basic information about each user account on the system. Each line in `/etc/passwd` represents a user and includes details such as the username, user ID (UID), group ID (GID), home directory, default shell, and other optional information.

   Example entry:
   ```bash
   john:x:1000:1000:John Doe:/home/john:/bin/bash
   ```

   - `john`: Username
   - `x`: Placeholder for the encrypted password (actual passwords are stored in `/etc/shadow`)
   - `1000`: UID (User ID)
   - `1000`: GID (Primary Group ID)
   - `John Doe`: Full name or user description
   - `/home/john`: Home directory
   - `/bin/bash`: Default shell

2. `/etc/shadow`: This file stores encrypted passwords and other password-related information for user accounts. It is readable only by the superuser (`root`) to enhance security and prevent unauthorized access to sensitive data.

   Example entry:
   ```bash
   john:$6$9u3OwD8o$7x8v9G2B6Bz2L6bLob5JfPjCvZDO1vDSOLCp6ZcOhp3A.XM6j/t8Ea3X9toS6XJv1bEY1T2Yvka4D0v61OyGl.:18852:0:99999:7:::
   ```

   - `john`: Username
   - `$6$9u3OwD8o$7x8v9G2B6Bz2L6bLob5JfPjCvZDO1vDSOLCp6ZcOhp3A.XM6j/t8Ea3X9toS6XJv1bEY1T2Yvka4D0v61OyGl.`: Encrypted password
   - `18852`: Last password change time (in days since Jan 1, 1970)
   - `0`: Minimum password age
   - `99999`: Maximum password age
   - `7`: Password warning period
   - `::`: Unused fields

3. `/etc/group`: This file lists the groups on the system and their respective group IDs (GIDs). Each user belongs to one or more groups, and this file defines group membership.

   Example entry:
   ```bash
   users:x:1000:
   ```

   - `users`: Group name
   - `x`: Placeholder for the encrypted password (if group password is used, which is rare)
   - `1000`: GID (Group ID)
   - (Optional) List of usernames that belong to the group

4. `/etc/gshadow`: Similar to `/etc/shadow`, this file stores encrypted group passwords and other group-related information. It is also readable only by `root`.

5. `Home directories`: Each user typically has a home directory specified in `/etc/passwd`. This directory contains the user's personal files and configuration files.

6. `/var/spool/mail`: If configured, this directory contains mail spool files for users who receive mail on the system.

These files and directories collectively manage user accounts, their access permissions, passwords, and other related settings on Unix-like systems. Properly managing and securing these files is essential for maintaining system integrity and user privacy.

---------------------------

## Group

In Unix-like operating systems such as Linux, the `groups` command is used to display the groups a user belongs to. Here's how it works and what it does:

### Syntax:

```bash
   groups [username]
```

### Explanation:

- **Without arguments**: When you simply type `groups` without specifying a username, it displays the groups that your current user belongs to.

  Example:
  ```bash
  groups
  ```
  Output might look like:
  ```
  username adm cdrom sudo dip plugdev lpadmin sambashare
  ```

- **With a username**: You can also specify a username as an argument to `groups` to see which groups a specific user belongs to.

  Example:
  ```bash
  groups johndoe
  ```
  Replace `johndoe` with the username of the user you want to check.

### How It Works:

- The `groups` command reads information from the system files (`/etc/group` and others) to determine which groups a user is associated with.
- It lists both primary and supplementary groups that the user belongs to.

### Additional Notes:

- The groups listed typically include:
  - The user's primary group (listed first).
  - Any additional groups the user is a member of (supplementary groups).

- To view detailed information about a particular group, you can use the `getent` command along with `group` as follows:


```bash
getent group groupname
```

Replace `groupname` with the name of the group you want to examine. This command will display detailed information about the group, including its members.

For example:
```bash
getent group sudo
```

This will show details about the `sudo` group, including its members, which are typically users authorized to run commands with superuser privileges.

In summary, the `groups` command is used to quickly view which groups a user belongs to, while `getent group` provides more detailed information about specific groups on the system.

The `groupmod` command in Unix-like operating systems is used to modify existing groups. It allows administrators to change various attributes of a group, such as the group name or group ID (GID), without directly editing system files. Here’s how you can use `groupmod`:

### Syntax:

```bash
sudo groupmod [options] GROUP
```

### Options:

- **-g GID**: Specify a new GID (group ID) for the group. This option allows you to change the numeric ID associated with the group.
  
  Example:
  ```bash
  sudo groupmod -g 1001 mygroup
  ```
  This command changes the GID of the group `mygroup` to `1001`.

- **-n NEW_GROUPNAME**: Specify a new name for the group. This option allows you to rename the group.

  Example:
  ```bash
  sudo groupmod -n newgroupname oldgroupname
  ```
  This command renames the group `oldgroupname` to `newgroupname`.

- **-o**: This option allows changing the GID to a non-unique value. It is useful when you want to assign a non-unique GID to multiple groups.

- **-A, -M, -P**: These options are used to add, remove, or set the administrative login group (AG) for a user. 
