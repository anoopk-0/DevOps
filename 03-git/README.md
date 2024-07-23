# GIT

Git is a distributed version control system (DVCS) that helps developers track changes in source code during software development. It allows multiple developers to work on projects simultaneously, coordinating their work and integrating changes seamlessly. Git is widely used for managing code bases of all sizes, from small personal projects to large enterprise applications.

## CVS vs DVC

  CVS (Centralized Version Control)

    +-----------------------+
    |    Central Repository |
    +-----------------------+
    |                       |
    |   Developer Machines  |
    |                       |
    +-----------------------+

    Developers interact with a central repository where all code and history are stored. Operations like commits, updates, and merges require network access to the central server. Branching and merging are supported but typically involve operations directly on the central repository.

------------------------------------------------------

  DVC (Distributed Version Control - e.g., Git)

    +-----------------------+
    |  Local Developer Repo |
    +-----------------------+
    |    Local Developer    |
    |       Machines        |
    +-----------------------+
             |
             |
             v
    +-----------------------+      +-----------------------+
    | Remote Central Repo   | <--> | Remote Developer Repo |
    +-----------------------+      +-----------------------+

    Each developer has a complete copy (local repository) of the entire project history on their local machine. Developers can work independently and commit changes locally. Synchronization with remote repositories (central or other developers' repos) happens when network access is available. Branching and merging are lightweight and can be done locally before pushing changes to shared remote repositories.


 - CVS is a centralized version control system where all code and version history reside in a single central repository. Developers interact with this repository to commit changes, update their local copies, and merge branches. This centralized structure requires constant network connectivity to perform operations, making it less suitable for scenarios where network access is limited or unstable. Branching and merging in CVS are supported but can be more cumbersome compared to modern distributed systems. CVS maintains a linear history of changes, offering centralized control over backups and access permissions.

 - In contrast, DVC, exemplified by systems like Git, operates on a distributed model where each developer maintains a complete copy of the repository, including its entire history, on their local machine. This decentralized approach enables developers to work offline, commit changes locally, and synchronize with remote repositories at their convenience. Branching and merging are fundamental features in DVC, facilitating parallel development and flexible workflows. Each local repository serves as a full backup, enhancing redundancy and data integrity. Git, in particular, has gained widespread adoption in software development due to its robust branching model, support for distributed workflows, and resilience in diverse collaboration scenarios.

![dvc-cvs](./Images/dvc-cvs.png)

----------

## git folder


![git folder](./Images/git-folder.png)


In Git, the `.git` folder is a crucial component of every Git repository. It's a hidden directory located in the root directory of your Git repository, and it contains all the metadata and configuration information that Git needs to manage your project's version control. Here’s what you can find inside the `.git` folder:

1. `Repository Configuration`: The `.git/config` file stores configuration settings specific to your repository, such as remote repository URLs, branch settings, and user information.

2. `Repository Metadata`: The `.git/objects` directory contains all the commits, trees, and blobs that represent the history of your repository. Each file in this directory is hashed and compressed to save space and ensure data integrity.

3. `Branches and Head Pointer`: The `.git/refs` directory holds references to commits, tags, and heads (branches). For example, `.git/refs/heads` stores the references to branch heads, and `.git/refs/tags` stores references to tags.

4. `Commit Logs`: The `.git/logs` directory contains logs of various actions performed on the repository, such as commits, fetches, and merges.

5. `Index File`: The `.git/index` file is also known as the "staging area" or "cache". It holds a snapshot of the content of the working tree and is used to build the next commit.

6. `Hooks`: The `.git/hooks` directory contains scripts that Git executes before or after certain actions, such as committing or merging. These scripts can be customized to automate tasks or enforce policies.

7. `Configuration Templates`: The `.git/templates` directory holds template files used when initializing new repositories or cloning existing ones. These can be customized to include default files or configurations.

Visibility and Management:

   - `Hidden Directory`: The `.git` directory is hidden by default in many file explorers and command-line interfaces because its name begins with a dot (`.`). This prevents accidental modification or deletion of critical repository data.

   - `Backup Considerations`: It’s essential to back up the `.git` directory along with your project files to ensure you can restore your repository in case of data loss or corruption.

   - `Cloning and `.git``: When you clone a Git repository from a remote server using `git clone`, Git copies the entire `.git` directory along with your project files to your local machine. This allows you to work with the complete history and metadata of the repository locally.
  
------------------

## Git commands 

Configuration
   - `git config --global user.name "Your Name"`: Set your username globally.
   - `git config --global user.email "your.email@example.com"`: Set your email globally.
   - `git config --global color.ui auto`: Enable helpful colorization of Git output.

Starting a Repository
   - `git init`: Initialize a new Git repository in the current directory.
   - `git clone <repository-url>`: Clone a repository from a remote server to your local machine.

Basic Snapshotting
   - `git add <file>`: Add file(s) to the staging area.
   - `git commit -m "Commit message"`: Commit staged changes to your local repository.

Branching & Merging
   - `git branch`: List all branches in the repository.
   - `git branch <branch-name>`: Create a new branch.
   - `git checkout <branch-name>`: Switch to a different branch.
   - `git merge <branch-name>`: Merge changes from one branch into the current branch.
   - `git rebase <branch-name>`: Reapply commits on top of another base tip.

Inspecting & Comparing
   - `git status`: Show the status of files in the repository.
   - `git log`: Show the commit history.
   - `git diff`: Show changes between commits, commit and working tree, etc.

Working with Remotes
   - `git remote add <name> <url>`: Add a new remote repository.
   - `git fetch <remote>`: Download objects and refs from another repository.
   - `git pull <remote> <branch>`: Fetch from and integrate with another repository or a local branch.
   - `git push <remote> <branch>`: Update remote refs along with associated objects.

Undoing Changes
   - `git reset HEAD <file>`: Unstage a file from the staging area.
   - `git checkout -- <file>`: Discard changes in the working directory for a specific file.
   - `git revert <commit>`: Create a new commit that undoes changes made in a previous commit.

Miscellaneous
   - `git tag <tag-name>`: Create a tag for a specific commit.
   - `git stash`: Stash changes in a dirty working directory away.
   - `git submodule`: Initialize, update or inspect submodules.

--------------

## IMP

1. `git pull -r` 
    (git pull --rebase) is a command used to fetch and integrate changes from a remote repository into your local branch using rebase instead of merge, maintaining a cleaner and more linear commit history. Use it when you prefer a streamlined history and understand the implications of rebasing on collaborative workflows.

    ```s
    git pull -r origin main
    ```

2. `merge vs rebase` :  

    - are two different strategies in Git used to integrate changes from one branch into another.

    - Merge: Use merge when preserving the full history of changes and the branching structure is important. It's generally safer and simpler for collaborative workflows, especially with shared branches like main or develop.  When you merge branches, Git takes the endpoint of both branches and creates a new commit that combines the changes. This results in a merge commit, which has two parent commits (one from each branch).

    - Rebase: Use rebase when you want to maintain a cleaner and more linear history. It's particularly useful for feature branches or when preparing a branch for integration into another branch (like main or develop). However, exercise caution when rebasing commits that have already been pushed and shared with others. Git takes the commits from your current branch (say, a feature branch) and places them on top of another branch (usually master or another main branch).

3. `git rm --cached path/to/file_name`: To remove a file from both your local repository and the remote 

4. `git push -d origin branch_name`: delete the file in the remote

5. `git reset --hard <commit_hash>`: to revert to a specific commit in local
        
    ```s
        # Revert changes locally
        git checkout -- myfile.txt

        # Stage changes (if necessary) and commit
        git add myfile.txt
        git commit -m "Reverting changes to myfile.txt"

        # Push changes to remote (if necessary)
        git push origin main
    ```

    --`hard` is typically used when you want to completely discard changes and start over from a specific commit. Use it with caution because it permanently removes uncommitted changes.

    --`soft` is useful when you want to undo a commit but keep the changes in your working directory and staging area for further modifications or corrections before committing again.


6. `git commit --amend` : command is used to modify the last commit in Git. It combines staged changes with the previous commit, effectively allowing you to edit the last commit message or add more changes to it.

7. `git reset` and `git revert` : are both Git commands used to undo changes
   
   - Permanent vs. Safe Undo: git reset modifies the commit history and is considered a more aggressive change because it can discard changes permanently (--hard reset). git revert, on the other hand, creates new commits to undo changes, leaving the original commits intact.

   - Effect on Collaborators: git reset can potentially disrupt collaborators' work if used after pushing changes to a shared repository, especially if you force-push (--force). git revert is safer in shared environments as it maintains the existing commit history.

   - Commit History: git reset rewrites the commit history, while git revert adds new commits to undo changes, preserving the commit history's integrity.
  
`git reset` is used to rewrite history and make changes locally, while `git revert` is used to safely undo changes in a way that preserves commit history and is suitable for shared repositories.

8. Fork: 
   - A fork creates a fully independent copy of a Git repository. When you fork a repository, you duplicate the entire project, including its files, branches, and commit history. This copy resides under your own account on the hosting platform (like GitHub). Changes made to a fork do not affect the original repository unless you explicitly propose those changes back through a pull request.

   - On the other hand, when you clone a repository with Git, you create a linked copy that initially mirrors the target repository. A clone allows you to work with the project locally on your own machine. Unlike a fork, which is a distinct copy, a clone can be kept synchronized with the original repository by pulling in updates made to the remote repository. This synchronization enables you to work with the most current version of the project and collaborate effectively with others.