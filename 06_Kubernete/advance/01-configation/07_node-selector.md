# Node Selectors

Objective: Control pod placement based on node specifications in a Kubernetes cluster.

Example Scenario:
- Cluster consists of 3 nodes:
  - Node 1: Larger node with higher hardware resources.
  - Node 2 and Node 3: Smaller nodes with lower resources.

Problem Statement:
- Data processing workloads need to run on the larger node (Node 1) due to resource requirements.
- Default Kubernetes setup allows pods to run on any node, which may lead to inefficient resource usage.

Solution:
- NodeSelectors: Simple method to restrict pod scheduling based on node labels.

## Steps:
1. Label Nodes:
   - Use `kubectl label nodes` command to assign labels to nodes.
   - Example:
     ```bash
     kubectl label nodes node1 size=large
     ```
     - This labels `node1` with `size=large`, indicating it has higher resources.

2. Pod Definition:
   - Define a pod with a specific nodeSelector to enforce placement on a node with a particular label.
   - Example pod definition:
     ```yaml
     apiVersion: v1
     kind: Pod
     metadata:
       name: data-processing-pod
     spec:
       containers:
         - name: data-processor
           image: data-processor-image
       nodeSelector:
         size: large
     ```
     - This ensures `data-processing-pod` runs only on nodes labeled `size=large`.

3. Deployment:
   - Apply the pod definition:
     ```bash
     kubectl apply -f pod-definition.yaml
     ```
     - Kubernetes scheduler places `data-processing-pod` on `node1` (the only node with `size=large`).

`Limitations`:
- Single Label: NodeSelectors restrict placement based on a single label-value pair.
- Complex Requirements: Cannot express complex conditions (e.g., large or medium nodes) with NodeSelectors alone.

Next Steps:
- Node Affinity and Anti-Affinity:
  - Introduces more advanced scheduling rules using node affinity and anti-affinity features.
  - Allows specifying more complex node selection rules based on labels.

Conclusion:
- NodeSelectors are effective for straightforward node selection based on single labels.
- For more nuanced requirements, node affinity and anti-affinity provide flexible options.

---

Summary Commands:
- Label Node:
  ```bash
  kubectl label nodes node1 size=large
  ```
- Apply Pod Definition:
  ```bash
  kubectl apply -f pod-definition.yaml
  ```

Note: Labels are crucial for defining node characteristics and enabling Kubernetes scheduling rules effectively.

# Note Affinity


Introduction:

    - Node affinity in Kubernetes ensures that pods are scheduled onto specific nodes based on defined criteria.
    - It offers more advanced capabilities compared to node selectors.

Node Selectors vs. Node Affinity:

    - Node selectors are limited to basic expressions.
    - Node affinity allows more complex specifications for pod placement.

Node Affinity Structure:
- Under `spec`, there is `affinity`, then `nodeAffinity`.
- A key property is `requiredDuringSchedulingIgnoredDuringExecution`, specifying affinity rules during scheduling.

Using Node Selector Terms (NRA):
- Key-value pairs (`key operator value`) define node labels.
- Example: `size: large` ensures pods are placed on nodes labeled with `size=large`.
- Operators like `In` (matching any value in a list) and `NotIn` (excluding specific values) are used.

## Advanced Operators:
- `Exists` checks if a label exists on nodes.
- Other operators are available; consult Kubernetes documentation for details.

## Node Affinity Types:
- Required during scheduling, ignored during execution: Pod must match affinity rules during scheduling. Changes afterward do not affect placement.
- Preferred during scheduling, ignored during execution: Scheduler tries to match rules but can place pods elsewhere if no match.

Lifecycle Considerations:
- During Scheduling: Affinity rules apply when pods are first created.
- During Execution: Changes (like label updates) do not affect already running pods under current types.

Future Node Affinity Types:
- Required during execution: Planned to evict pods if node labels change, ensuring continuous affinity compliance.

Example:
- Scenario: Ensure a large data processing pod (`large-pod`) is placed only on nodes labeled as `size=large`.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: large-pod
spec:
  containers:
    - name: main
      image: my-large-processing-image
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: size
                operator: In
                values:
                  - large
```

Summary:
- Node affinity optimizes pod placement based on node labels.
- It ensures efficient workload distribution and resilience to node label changes.
- Practice with coding exercises to master node affinity rules in Kubernetes.

-----------

 
## Taints and Tolerations vs node affnity

Objective: Ensure blue, red, and green pods are placed only on nodes marked with corresponding taints.

Setup:
- Apply taints to nodes:
  - Node `blue` is tainted with `color=blue:NoSchedule`
  - Node `red` is tainted with `color=red:NoSchedule`
  - Node `green` is tainted with `color=green:NoSchedule`

- Define tolerations on pods:
  - Blue pod tolerates `color=blue:NoSchedule`
  - Red pod tolerates `color=red:NoSchedule`
  - Green pod tolerates `color=green:NoSchedule`

Example YAML for Blue Pod:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: blue-pod
spec:
  containers:
    - name: main
      image: my-blue-image
  tolerations:
    - key: "color"
      operator: "Equal"
      value: "blue"
      effect: "NoSchedule"
```

### Example 2: Node Affinity

Objective: Ensure blue, red, and green pods are scheduled on nodes labeled accordingly.

Setup:
- Label nodes:
  - Node `blue` is labeled with `color=blue`
  - Node `red` is labeled with `color=red`
  - Node `green` is labeled with `color=green`

- Set node affinity rules on pods:
  - Blue pod has `requiredDuringSchedulingIgnoredDuringExecution` affinity for node labeled `color=blue`
  - Red pod has `requiredDuringSchedulingIgnoredDuringExecution` affinity for node labeled `color=red`
  - Green pod has `requiredDuringSchedulingIgnoredDuringExecution` affinity for node labeled `color=green`

Example YAML for Red Pod:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: red-pod
spec:
  containers:
    - name: main
      image: my-red-image
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: "color"
                operator: "In"
                values:
                  - "red"
```

### Example 3: Combining Taints, Tolerations, and Node Affinity

Objective: Ensure exclusive pod placement while preventing other teams' pods on designated nodes.

Setup:
- Use taints and tolerations for node exclusivity.
- Use node affinity for precise pod placement.

Example YAML for Green Pod (Combination):
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: green-pod
spec:
  containers:
    - name: main
      image: my-green-image
  tolerations:
    - key: "color"
      operator: "Equal"
      value: "green"
      effect: "NoSchedule"
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
          - matchExpressions:
              - key: "color"
                operator: "In"
                values:
                  - "green"
```

### Summary

- Taints and tolerations are used to restrict node access to specific pods.
- Node affinity ensures pods are placed on nodes with specified labels.
- Combining these concepts provides comprehensive control over pod placement in a Kubernetes cluster.

These examples illustrate how taints, tolerations, and node affinity can be implemented in Kubernetes to achieve specific scheduling requirements and ensure workload isolation within a shared cluster environment.