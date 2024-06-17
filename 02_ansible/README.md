# Configure password less Auth

step 1: (in controller) ssh-keygen [it will generate a public/private IP]

     - will get files generated with private and public keys (.pub)

step 2: again do the same step in the host servers, creating public and private though ssh-keygen.

    - can view the files though  `ls ~/.ssh/`
    - files authorized_keys  id_ed25519  id_ed25519.pub
    - open the authorized_keys files and paste the controller public key

## Details steps:

To connect your local macOS laptop with an AWS EC2 instance using password less authentication and run Ansible playbooks on the EC2 instance, you can follow these general steps:

Generate SSH Key Pair: If you haven't already, generate an SSH key pair on your macOS laptop.
`ssh-keygen -t rsa`
Follow the prompts to generate the key pair. This will create a public key (id_rsa.pub) and a private key (id_rsa) in the ~/.ssh/ directory.

Store the Public Key on the EC2 Instance: Log in to your EC2 instance and append the contents of your laptop's public key (id_rsa.pub) to the ~/.ssh/authorized_keys file on the EC2 instance.

`cat ~/.ssh/id_rsa.pub | ssh user@ec2-instance 'cat >> ~/.ssh/authorized_keys'`

Replace user with your EC2 instance username and ec2-instance with your instance's public DNS or IP address.

Test SSH Connection: Ensure you can SSH into the EC2 instance from your macOS laptop without providing a password.

`ssh user@ec2-instance`
If successful, you should be able to log in without being prompted for a password.

Install Ansible: If Ansible is not already installed on your macOS laptop, you can install it using Homebrew.

`brew install ansible`

Write Ansible Playbooks: Write your Ansible playbook(s) on your macOS laptop. Ensure that you have defined the hosts to target the EC2 instance(s) you want to manage.

Run Ansible Playbook: Run your Ansible playbook from your macOS laptop. Ensure that the SSH connection information and the playbook tasks are correctly configured.

`ansible-playbook -i inventory_file playbook.yml`

Replace inventory_file with the path to your Ansible inventory file and playbook.yml with the name of your playbook file.

## playbook

Playbooks are a powerful tool for automating tasks in IT infrastructure management. They are written in YAML format and consist of a set of plays, each of which defines a set of tasks to be executed on remote hosts.

It is also not mandatory to have a playbook, for simple file and single server configuration can done without playbook. we can use ansible adhoc command.

example : `ansible -i inventory all -m "shell" -a "touch devOps Class"`

- "shell" module, ansible has lots of module to perform task.
- '-m'

nginx: playbook

---

- name: install and start ngnix
  hosts: all
  become: true
  tasks:

  - name: install nginx

    # shell: apt install nginx

    apt:
    name: nginx
    state: present

  - name: start nginx
    # shell: systemctl start nginx
    service:
    name: nginx
    state: started

## inventory

inventory is a list of managed nodes, often organized into groups, on which Ansible runs tasks. Groups can be used to organize hosts based on different criteria like functionality, environment, or location. Grouping hosts in your inventory makes it easier to target specific sets of hosts with your Ansible commands and playbooks.

Here's how you can define groups in your Ansible inventory:

Static Inventory:
In a static inventory file (usually named hosts), you can define groups by placing hostnames or IP addresses under different group headings. For example:

    [web]
    webserver1.example.com
    webserver2.example.com

    [db]
    dbserver1.example.com
    dbserver2.example.com

Dynamic Inventory:
Ansible also supports dynamic inventories, which are scripts or programs that generate inventory dynamically based on some external data source (like cloud providers, configuration management databases, etc.). These scripts can dynamically group hosts based on various criteria.

    Once you have defined your groups, you can target them in your Ansible commands and playbooks. For example:

    `ansible web -m ping`
    This command will ping all hosts in the web group.
    `

    - hosts: db
      tasks:
      - name: Check connectivity
        ping:`

    This playbook will run the ping module on all hosts in the db group.

Grouping hosts in your inventory allows you to manage your infrastructure more efficiently and apply configurations consistently across different sets of hosts.

# Ansible Roles

Ansible roles are a way to organize your playbooks and make them reusable, modular, and easier to manage. A role is essentially a collection of related tasks, handlers, variables, templates, and files organized in a defined directory structure.
my_role/
├── defaults/
│ └── main.yml
├── files/
├── handlers/
│ └── main.yml
├── meta/
│ └── main.yml
├── tasks/
│ └── main.yml
├── templates/
├── vars/
│ └── main.yml
└── README.md

defaults/: Contains default variables for the role.
files/: Contains static files that need to be transferred to the hosts.
handlers/: Contains handlers, which are triggered by tasks and can be used to restart services, for example.
meta/: Contains metadata about the role, such as dependencies.
tasks/: Contains the main set of tasks for the role.
templates/: Contains templates, which are files that include variables and control structures.
vars/: Contains variables for the role.
README.md: A documentation file for the role.

---

- name: My playbook
  hosts: all
  roles:
  - my_role
