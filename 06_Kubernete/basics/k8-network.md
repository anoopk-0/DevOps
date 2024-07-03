# Basic Network

Certainly! Here are the notes based on the lecture about networking in Kubernetes:

---

`Basics of Networking on a Single Node:`
- Kubernetes operates on nodes, each having its own IP address.
- For example, node IP: 192.168.1.2.
- MiniKube setup: Consider VM's IP (e.g., 182.168.1.10).

`Pod Networking:`
- Kubernetes assigns IPs to pods, not containers.
- Each pod gets its unique internal IP (e.g., 10.244.0.2).
- IP assignment managed within a private network (e.g., 10.244.0.0/16).

`Challenges in Multi-Node Clusters:`
- In a multi-node setup (nodes: 192.168.1.2, 192.168.1.3):
  - Pods on different nodes sharing the same internal IP (e.g., 10.244.0.2).
  - This leads to IP conflicts and communication issues.

`Requirements for Kubernetes Networking:`
- Kubernetes requires a networking solution where:
  - Pods can communicate across nodes without NAT.
  - Nodes can communicate with pods.
  - All containers and pods can communicate seamlessly.

`Networking Solutions:`
- Kubernetes does not automatically resolve networking conflicts.
- Various solutions available:
  - Calico, Flannel, Cisco ACI, VMware NSX-T, etc.
- Choice depends on deployment environment (on-premises, cloud).

`Implementing Custom Networking (e.g., Flannel, Calico):`
- Select a solution based on environment (e.g., Flannel for on-premises).
- Solution manages IPs, creates virtual networks for pods and nodes.
- Ensures unique IPs across the cluster, facilitates pod-to-pod communication.

`Conclusion:`
- With custom networking (e.g., Flannel or Calico), Kubernetes ensures:
  - Pods and nodes have distinct IPs.
  - Seamless communication using assigned IP addresses.

`Next Steps:`
- Understanding and implementing Kubernetes networking ensures efficient cluster operations.
- Choose appropriate networking solution based on deployment specifics.


![alt text](../images/IMG_6808.png) 

![alt text](../images/IMG_6810.png) 

![alt text](../images/IMG_6811.png)


---

These notes summarize the key points discussed in the lecture on networking within Kubernetes, covering single-node setups, challenges in multi-node clusters, requirements for Kubernetes networking, available solutions, and the implementation of custom networking solutions like Flannel or Calico.
