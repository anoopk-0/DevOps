# Kubernetes (k8s)

Kubernetes is an open-source platform designed to automate the deployment, scaling, and management of containerized applications. Originally developed by Google and now maintained by the Cloud Native Computing Foundation (CNCF), Kubernetes provides a container-centric infrastructure. It allows you to deploy your applications quickly and predictably, scale them seamlessly, and manage them efficiently across clusters of hosts.

-----

## Container:
- A container is a lightweight and portable runtime environment that encapsulates application code along with its dependencies, configurations, and runtime libraries. 

  - **Runnable Instance**: A container is the instantiated form of an image that is running as a process on a host machine.
  
  - **Isolation**: Containers provide process isolation, meaning each containerized application runs in its own isolated environment, sharing the host operating system's kernel but with its own filesystem, network, and process space.

## Image:

  An image is a read-only template used to create containers. It contains everything needed to run an application: code, runtime, libraries, environment variables, and configuration files. Think of it as a snapshot or blueprint of an application.

   **Immutable**: Images are immutable, meaning once created, they cannot be changed. Changes result in new images being built.
  
  **Layered Structure**: Images are often built in layers. Each layer represents a filesystem change (e.g., adding files, modifying files), and layers are stacked on top of each other to form the complete image.


## Relationship:
- An image serves as a blueprint or template from which containers are instantiated. When you run an image, it becomes a container in execution. Multiple containers can be instantiated from the same image, each running independently with its own filesystem and state.

Note: while an image is a static, immutable template that defines an application's environment, a container is a live, runnable instance of that image. Containers provide the execution environment for applications, while images provide the definition of that environment. Understanding these distinctions is crucial for effectively deploying and managing applications in containerized environments.

-----

## Container orchestration

Container orchestration refers to the automated management, deployment, scaling, and operation of containerized applications. It addresses the complexities involved in running multiple containers across distributed environments. Here are key aspects of container orchestration:

1. `Deployment Automation`: Orchestration platforms automate the deployment process of containerized applications. They manage the lifecycle of containers, ensuring that they are deployed correctly, started, stopped, and updated as needed.

2. `Scaling`: Orchestration enables automatic scaling of containerized applications based on factors like CPU utilization, memory usage, or incoming traffic. It ensures that the application can handle varying workloads efficiently.

3. `Load Balancing`: Orchestration platforms provide built-in mechanisms for load balancing across containers and nodes (hosts) within a cluster. This ensures even distribution of traffic and prevents any single container or node from becoming overloaded.

4. `Service Discovery`: Orchestration tools facilitate service discovery by assigning each container a unique IP address and DNS name. This makes it easier for containers to communicate with each other and for clients to locate services within the cluster.

5. `Health Monitoring and Self-Healing`: Orchestration platforms continuously monitor the health of containers and nodes. They can automatically restart containers that fail, replace unhealthy containers with new ones, and manage failovers to ensure high availability of applications.

6. `Resource Management`: Orchestration tools manage resources such as CPU, memory, and storage across the cluster. They optimize resource allocation and utilization to maximize efficiency and performance.

7. `Rollouts and Rollbacks`: Orchestration platforms support controlled rollouts and rollbacks of application updates. They can update containers gradually (canary deployments) or in batches to minimize downtime and impact on users. In case of issues, they facilitate rollback to a previous version.

8. `Security`: Orchestration tools provide mechanisms for securing containerized applications and the orchestration platform itself. This includes access control, network segmentation, encryption, and vulnerability scanning.

Popular container orchestration platforms include `Kubernetes, Docker Swarm, Apache Mesos, and HashiCorp Nomad`. Among these, 

NOTE: `Kubernetes has emerged as the de facto standard due to its robust feature set, large community support, and extensive ecosystem.`

Container orchestration is essential for managing the complexities of deploying and running containerized applications at scale in modern cloud-native environments. It enables organizations to achieve agility, scalability, reliability, and efficiency in their application delivery pipelines.


## Kubernetes architecture

Nodes in Kubernetes Architecture:
------------------------------------

1.`Master Node:`
   -`API Server:` Acts as the control plane for the Kubernetes cluster. It exposes the Kubernetes API, which users, management tools, and other parts of Kubernetes interact with to manage the cluster.
   -`Scheduler:` Assigns pods (groups of containers) to nodes based on resource requirements and constraints.
   -`Controller Manager:` Manages different aspects of the cluster's state, ensuring that the desired state (as defined by users and applications) matches the actual state.
   -`etcd:` Distributed key-value store that stores cluster configuration and state, ensuring consistency across the cluster.

2.`Worker Node(s):`
   -`Kubelet:` Agent running on each node, responsible for managing the containers and pods running on that node. It interacts with the container runtime (like Docker) to execute containers.
   -`Kube-proxy:` Maintains network rules (iptables) on nodes, enabling communication across the cluster and with external networks. It also manages the routing of traffic to services within the cluster.

3.`Container Runtime:`
   - Software responsible for running containers. Kubernetes supports various runtimes such as Docker, containerd, and others. The container runtime executes containers created from images and manages their lifecycle.

How Nodes Work Together:
-----------------------------

-`Master Node` manages the cluster's overall state and configuration, acting as the brain of the Kubernetes cluster.
-`Worker Nodes` host applications and services as pods. Each node runs Kubelet and Kube-proxy to manage containers and networking, respectively.
-`etcd` ensures that all nodes in the cluster have consistent information about the cluster's state, configurations, and policies.

Node Communication:
----------------------------

-`API Server` on the master node is the entry point for all administrative tasks and communication within the cluster.
-`Kubelet` on each worker node communicates with the API server to receive instructions (like pod deployment) and report node status.
-`Kube-proxy` manages network rules to enable communication between pods and services within the cluster and with external networks.

Scalability and Resilience:
-----------------------------------

- Kubernetes architecture is designed for scalability and resilience. Nodes can be added or removed from the cluster dynamically without disrupting running applications.
- Components like the Scheduler and Controller Manager ensure that workloads are distributed efficiently and that the cluster maintains its desired state.

In summary, Kubernetes architecture revolves around master and worker nodes. The master node manages the cluster's control plane, while worker nodes execute containerized applications and manage networking. This distributed architecture provides flexibility, scalability, and resilience for running modern, cloud-native applications at scale.

![architecure](../images/architecure.png)


## Node Components

In Kubernetes (often abbreviated as k8s), a node refers to a single machine (physical or virtual) in a cluster that is part of the Kubernetes environment. Each node is responsible for running containerized applications managed by Kubernetes. Here’s a breakdown of what a node encompasses:

1. **Components**: Each Kubernetes node runs several components to manage containers and communicate with the control plane (master node). These components include:
   - **kubelet**: The primary agent that runs on each node and ensures containers are running in a Pod.
   - **kube-proxy**: Maintains network rules on the node and performs connection forwarding.
   - **Container runtime**: The software responsible for running containers, such as Docker, containerd, or CRI-O.

2. **Capacity**: Nodes have computational resources such as CPU and memory, as well as storage resources, which are utilized by the containers they host.

3. **Pods**: Nodes can host multiple Pods, which are the smallest deployable units of computing that Kubernetes manages. Each Pod can contain one or more containers that share resources and a networking namespace.

4. **Networking**: Nodes are interconnected to form a cluster. They communicate with each other and with the control plane components. They also manage the networking for the Pods they host through services like kube-proxy.


### Master Node Components:

In Kubernetes (often abbreviated as k8s), there are several key components that work together to manage containerized applications across a cluster of nodes. These components can be categorized into two main groups: control plane components and node components.

### Control Plane Components:

1. **kube-apiserver**:
   - The API server is the front-end for Kubernetes. It exposes the Kubernetes API, which all other components and clients interact with to manage the cluster.

2. **etcd**:
   - etcd is a distributed key-value store that Kubernetes uses to store all of its cluster data (e.g., configuration data, state data, metadata). It is used as the primary data store for Kubernetes and is crucial for maintaining cluster state.

3. **kube-scheduler**:
   - The scheduler is responsible for placing newly created Pods onto nodes in the cluster. It takes into account factors such as resource requirements, affinity/anti-affinity specifications, data locality, and other constraints when making scheduling decisions.

4. **kube-controller-manager**:
   - The controller manager runs controller processes, which are responsible for managing the state of the cluster and responding to events (e.g., starting new Pods, scaling deployments). Examples of controllers include the Node Controller, Replication Controller, Endpoint Controller, and others.

5. **cloud-controller-manager** (optional):
   - This component runs controllers that interact with the underlying cloud provider's API to manage resources (e.g., load balancers, volumes). It abstracts the cloud-specific code away from the core Kubernetes components.

### Node Components:

1. **kubelet**:
   - The kubelet is an agent that runs on each node in the cluster. It is responsible for ensuring that containers are running in Pods as expected. It communicates with the control plane components to receive Pod specifications (via the API server) and manages the containers associated with those Pods on the node.

2. **kube-proxy**:
   - kube-proxy is responsible for implementing the Kubernetes networking services on each node. It maintains network rules (iptables rules) to handle traffic to and from Pods. It also enables communication across the cluster and with external network endpoints.

3. **Container Runtime**:
   - The container runtime is the software responsible for running containers on each node. Kubernetes supports various container runtimes, including Docker, containerd, and CRI-O, among others. The runtime is responsible for pulling container images, starting and stopping containers, and handling container lifecycle events.

### Additional Components and Add-Ons:

- **DNS Service** (CoreDNS or kube-dns):
  - Provides DNS resolution for Kubernetes Services and Pods within the cluster.

- **Ingress Controllers**:
  - Manages external access to services in a cluster, typically via HTTP or HTTPS.

- **Dashboard**:
  - A web-based user interface for managing and monitoring Kubernetes clusters.

- **Monitoring and Logging Tools** (e.g., Prometheus, Fluentd):
  - Provides visibility into cluster performance, logs, and events.

- **Cluster Autoscaler**:
  - Automatically adjusts the number of nodes in a cluster based on resource usage.

These components work together to provide the orchestration and management capabilities that Kubernetes is known for, enabling scalable and resilient containerized applications. Each component plays a critical role in different aspects of cluster management, from scheduling and networking to monitoring and resource management.

### How Components Work Together:

- `API Server` acts as the front-end for Kubernetes. Users, the command-line interface (CLI), or other parts of the cluster interact with the API server to manage the cluster.
- `Scheduler` assigns workloads to nodes based on resource requirements and other constraints.
- `Controller Manager` watches for changes and ensures the cluster remains in the desired state.
- `etcd` stores configuration data, allowing Kubernetes to recover state after a restart or failure.
- `Kubelet` and `Kube-proxy` run on each node, managing containers and networking, respectively.

Kubernetes architecture is designed with a modular and extensible approach, enabling it to support a wide range of workloads and configurations, from small development setups to large-scale production environments. Understanding these components helps in deploying, managing, and troubleshooting Kubernetes clusters effectively.

![Node components](../images/node-compo.png)

## Kubectl

`kubectl` is the command-line tool used to interact with Kubernetes clusters. It allows you to perform various operations on Kubernetes resources, manage clusters, and troubleshoot issues. Here are some of the most commonly used `kubectl` commands:

Managing Resources:


   - `kubectl apply -f <filename>`: Applies a configuration file to create or update resources in the cluster. This is typically used with YAML files describing Kubernetes resources like pods, services, deployments, etc.
   
   - `kubectl get <resource>`: Retrieves information about one or more resources. For example, `kubectl get pods` lists all pods in the current namespace.
   
   - `kubectl describe <resource> <name>`: Provides detailed information about a specific resource. For example, `kubectl describe pod mypod`.
   
   - `kubectl delete <resource> <name>`: Deletes a specific resource. For example, `kubectl delete pod mypod`.
  

-----------------

Viewing and Logging:

   - `kubectl logs <pod_name>`: Displays the logs of a specific pod. For example, `kubectl logs mypod`.
   
   - `kubectl get events`: Retrieves events from the cluster. Useful for troubleshooting and monitoring activities in the cluster.


------------------

Managing Cluster:

   - `kubectl cluster-info`: Displays cluster information, such as the Kubernetes master's URL and the cluster services endpoints.
   
   - `kubectl config view`: Displays the current kubeconfig configuration, which includes cluster settings, authentication details, and contexts.

-------------------

Scaling and Updating:

   - `kubectl scale <resource_type> <name> --replicas=<number>`: Scales a deployment, replicaset, or statefulset by adjusting the number of replicas.
   
   - `kubectl rollout status <resource_type> <name>`: Monitors the status of a rollout (deployment, daemonset, statefulset, etc.).
   
   - `kubectl rollout history <resource_type> <name>`: Displays the revision history of a rollout.

-------------------------

Interacting with Pods:

   - `kubectl exec -it <pod_name> -- <command>`: Executes a command in a running pod. For example, `kubectl exec -it mypod -- /bin/bash`.
   
   - `kubectl port-forward <pod_name> <local_port>:<pod_port>`: Forwards connections to a port on the local machine to a port on a pod. For example, `kubectl port-forward mypod 8080:80`.

-----------------------

Managing Namespaces:

   - `kubectl get namespaces`: Lists all namespaces in the cluster.
   
   - `kubectl create namespace <name>`: Creates a new namespace.
   
   - `kubectl delete namespace <name>`: Deletes a namespace and all its resources.

These commands cover basic operations with `kubectl`. Kubernetes offers a wide range of features and resources, so `kubectl` commands can be extended and customized with various options and flags to suit specific needs and scenarios in managing Kubernetes clusters and applications.