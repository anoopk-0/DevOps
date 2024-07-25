# Introduction to Ansible Modules

Ansible modules are categorized based on their functionalities, providing a wide range of capabilities for automation tasks.

1. System Modules

   - **Functionality:** Perform system-level actions such as managing users, groups, IP tables, firewall configurations, logical volumes, mounts, and services.
   - **Example:** Using the `service` module to start, stop, or restart services like PostgreSQL or HTTPD.

  ```yaml
  - name: Start PostgreSQL service
    service:
      name: postgresql
      state: started
  ```

`Idempotency`: Modules like `service` ensure idempotent operations where Ansible checks and performs actions only if necessary to achieve the desired state.

2. Command Modules
   
   - **Functionality:** Execute commands or scripts on remote hosts.
   - **Example:** Using the `command` module to run commands like `date` or interactively execute scripts using `expect`.

  ```yaml
  - name: Run date command
    command: date
  
  - name: Change directory and list resolv.conf
    command: cat /etc/resolv.conf
    args:
      chdir: /etc
  ```

3. File Modules
   - **Functionality:** Manage files, directories, and their permissions.
   - **Examples:** Use `lineinfile` to modify specific lines in files or `archive` to compress and uncompress files.

  ```yaml
  - name: Add DNS server to resolv.conf
    lineinfile:
      path: /etc/resolv.conf
      line: "nameserver 8.8.8.8"
  ```

4. Script Module
   - **Functionality:** Execute scripts located on the Ansible controller machine on remote nodes.
   - **Usage:** Ansible handles script transfer and execution seamlessly.

  ```yaml
  - name: Execute script on remote nodes
    script: /path/to/script.sh
    args:
      arg1: value1
      arg2: value2
  ```

5. Database Modules
    - **Functionality:** Interact with databases such as MongoDB, MySQL, MSSQL, or PostgreSQL to manage databases and configurations.

6. Cloud Modules
   - **Functionality:** Extensive support for various cloud providers (e.g., AWS, Azure, Google Cloud) to manage instances, networking, security, and containers.

7. Windows Modules
   - **Functionality:** Specific modules for managing Windows environments, including copying files (`win_copy`), executing commands (`win_command`), managing services, and interacting with the registry.

Key Points
   - **Idempotency:** Ansible modules are designed to ensure that operations are idempotent, maintaining system stability and consistency.
   - **Documentation:** Detailed documentation on each module is available at `docs.ansible.com`, providing comprehensive guidance on usage, parameters, and examples.
   - **Module Categories:** Understanding module categories (system, command, file, database, cloud, Windows) helps in selecting the right tool for specific automation tasks.
   - **Best Practices:** Use modules to abstract complex tasks, promote reusability, and maintain consistency across deployments.


## Introduction to Ansible Plugins

Ansible plugins are modular pieces of code that extend or enhance Ansible's core functionality, providing flexibility and customization options tailored to specific automation needs.

Challenges in Complex Infrastructure
   - **Dynamic Inventory Management:** Ansible's static inventory falls short in dynamically managing resources like instances, security groups, and tags across multiple VPCs and regions.
   - **Custom Cloud Resource Provisioning:** Requirements include creating AWS EC2 instances with specific configurations beyond standard Ansible modules.
   - **Advanced Load Balancer Management:** Need for dynamic configuration of load balancing rules, SSL certificates, and health checks to optimize cloud-based services.

Types of Ansible Plugins:

1. `Inventory Plugin:`
   - **Functionality:** Fetch real-time data about cloud resources from cloud provider APIs.
   - **Use Case:** Maintain an up-to-date inventory that accurately reflects the current state of infrastructure.
   - **Example:** Custom plugin fetching AWS EC2 instances based on tags or security groups.

2. `Module Plugin:`
   - **Functionality:** Extend Ansible modules to provision cloud resources with custom configurations.
   - **Use Case:** Create instances with specific AMI versions, instance types, and security groups tailored to application requirements.
   - **Example:** Custom module for provisioning AWS EC2 instances with specialized configurations.

3. `Action Plugin:`
   - **Functionality:** Simplify management tasks such as configuring load balancers.
   - **Use Case:** Define high-level tasks in playbooks for load balancer setup (rules, SSL, health checks).
   - **Example:** Action plugin for AWS ELB management, abstracting API calls for consistent configuration.

Additional Ansible Plugins
   - **Lookup Plugins:** Retrieve data from external sources (databases, APIs) for use within playbooks.
   - **Filter Plugins:** Manipulate and transform data within playbooks, enhancing variable handling and output formatting.
   - **Connection Plugins:** Enable Ansible to connect with diverse target systems (SSH, WinRM, Docker).
   - **Dynamic Inventory Plugins:** Retrieve inventory information dynamically from cloud providers or configuration management databases.
   - **Callback Plugins:** Hook into Ansible's execution lifecycle to capture events and execute custom actions during playbook runs.

Advantages of Using Ansible Plugins
   - **Extensibility:** Plugins allow customization beyond standard Ansible capabilities, adapting to complex automation scenarios.
   - **Flexibility:** Tailor automation workflows to meet specific infrastructure requirements in hybrid cloud environments.
   - **Reliability:** Ensure consistent and accurate management of cloud resources and configurations.
