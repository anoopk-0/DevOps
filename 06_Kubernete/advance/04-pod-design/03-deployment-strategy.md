
# Blue-Green Deployment Strategy on Kubernetes

Overview:
Blue-green deployment is a technique that reduces downtime and risk by running two identical production environments, called Blue and Green. At any time, only one of the environments is live, with the live environment serving all production traffic. This allows for testing of the new environment (Green) without affecting production traffic on the old environment (Blue). Once Green is fully tested and ready, traffic is switched from Blue to Green.

Steps to Implement:

1. `Initial Setup:`
   - Start with an existing deployment (Blue) running version v1 of your application.
   - Create a Kubernetes service that directs traffic to the pods labeled with `version=v1`.

2. `Deploying Green:`
   - Create a new deployment (Green) with version v2 of your application.
   - Label the pods in this deployment with `version=v2`.
   - Ensure Green deployment is fully deployed but without traffic routed to it initially.

3. `Testing Phase:`
   - Conduct thorough testing on the Green deployment (v2) to ensure it behaves as expected.

4. `Switching Traffic:`
   - Update the label selector on the Kubernetes service to `version=v2`.
   - This change directs the service to start routing traffic to pods labeled with `version=v2` (Green deployment).

Implementation Steps with Code Examples:

#Step 1: Initial Deployment (Blue)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-blue
spec:
  replicas: 5
  selector:
    matchLabels:
      app: myapp
      version: v1
  template:
    metadata:
      labels:
        app: myapp
        version: v1
    spec:
      containers:
        - name: myapp-container
          image: myapp:v1.0
          ports:
            - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
    version: v1
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

#Step 2: Deploying Green (New Version)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-green
spec:
  replicas: 5
  selector:
    matchLabels:
      app: myapp
      version: v2
  template:
    metadata:
      labels:
        app: myapp
        version: v2
    spec:
      containers:
        - name: myapp-container
          image: myapp:v2.0
          ports:
            - containerPort: 80
```

#Step 3: Testing and Validation
Ensure thorough testing of `myapp-green` deployment to validate functionality and performance.

#Step 4: Switching Traffic
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: myapp
    version: v2  # Update selector to route traffic to myapp-green
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

Diagram:
```
   User
    |
    v
 [ myapp-service ] --> [ myapp-blue pods (v1.0) ]  (initially)
                        [ myapp-green pods (v2.0) ] (after switch)
```

### Explanation:

- `Initial Setup:` `myapp-blue` deployment and `myapp-service` service are set up to route traffic to `v1` pods.
- `Deploying Green:` `myapp-green` deployment with `v2.0` pods is created but initially not exposed to traffic.
- `Testing Phase:` Validate `myapp-green` (v2.0) thoroughly.
- `Switching Traffic:` Update `myapp-service` selector to `version=v2`, directing traffic to `myapp-green` (v2.0) pods.

This approach ensures minimal downtime and allows for quick rollback to the `myapp-blue` deployment if issues are discovered during testing of `myapp-green`.

Implementing blue-green deployments in Kubernetes leverages the platform's powerful deployment and service management capabilities to ensure smooth transitions and minimal user impact during updates.

----------------

# Canary Deployment Strategy on Kubernetes

Overview:
Canary deployment is a technique where a new version of an application is gradually rolled out to a small subset of users or servers before being rolled out to the entire infrastructure. This allows for early testing of the new version in a production environment with reduced risk.

Steps to Implement:

1. `Initial Setup:`
   - Start with an existing deployment (Primary) running version v1 of your application.
   - Create a Kubernetes service that directs traffic to the pods labeled with `app=frontend` and `version=v1`.

2. `Deploying Canary:`
   - Create a new deployment (Canary) with version v2 of your application.
   - Initially, deploy a minimal number of pods (e.g., one pod) to receive a small percentage of traffic.
   - Label the pods in this deployment with `app=frontend` and `version=v2`.

3. `Routing Traffic:`
   - Update the Kubernetes service selector to route traffic based on a common label (`app=frontend`).

4. `Adjusting Traffic Split:`
   - Since Kubernetes services distribute traffic evenly across all pods matching the selector labels, adjust the number of pods in each deployment to control the traffic split.
   - For example, if the Primary deployment has 5 pods and the Canary deployment has 1 pod, the traffic split will naturally be 5:1 (83% to Primary, 17% to Canary).

5. `Testing Phase:`
   - Monitor and test the Canary deployment (v2) with the small subset of traffic to ensure everything works as expected.

6. `Promoting Canary to Primary:`
   - Once testing is successful, gradually upgrade the original Primary deployment to version v2 using a rolling update strategy.
   - Optionally, scale down and eventually delete the Canary deployment once it's no longer needed.

Implementation Steps with Code Examples:

#Step 1: Initial Deployment (Primary)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-primary
spec:
  replicas: 5
  selector:
    matchLabels:
      app: frontend
      version: v1
  template:
    metadata:
      labels:
        app: frontend
        version: v1
    spec:
      containers:
        - name: myapp-container
          image: myapp:v1.0
          ports:
            - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: frontend
    version: v1
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

#Step 2: Deploying Canary (New Version)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp-canary
spec:
  replicas: 1  # Only deploy one pod initially for canary testing
  selector:
    matchLabels:
      app: frontend
      version: v2
  template:
    metadata:
      labels:
        app: frontend
        version: v2
    spec:
      containers:
        - name: myapp-container
          image: myapp:v2.0
          ports:
            - containerPort: 80
```

#Step 3: Routing Traffic
Update the service to route traffic to both Primary and Canary deployments:
```yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-service
spec:
  selector:
    app: frontend  # Common label for both Primary and Canary
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
```

Diagram:
```
   User
    |
    v
 [ myapp-service ] --> [ myapp-primary pods (v1.0) ]
                        [ myapp-canary pod (v2.0) ]
```

### Explanation:

- `Initial Setup:` `myapp-primary` deployment and `myapp-service` service are set up to route traffic to `v1` pods.
- `Deploying Canary:` `myapp-canary` deployment with `v2.0` pod is created with minimal replicas (one pod) initially.
- `Routing Traffic:` `myapp-service` service is updated to route traffic based on a common label (`app=frontend`).
- `Adjusting Traffic Split:` Traffic distribution between `myapp-primary` and `myapp-canary` deployments is controlled by the number of pods in each deployment.
- `Testing Phase:` Validate `myapp-canary` (v2.0) deployment with the small subset of traffic.
- `Promoting Canary to Primary:` Once testing is successful, perform a rolling update on `myapp-primary` deployment to version v2.0.

### Conclusion:
Implementing a canary deployment strategy in Kubernetes allows for controlled testing of new application versions in a production-like environment before full rollout. While Kubernetes provides basic traffic splitting based on pod counts, advanced traffic management features can be achieved with service meshes like Istio, which offer more granular control over traffic distribution percentages.

This approach helps minimize risks associated with new releases and ensures smoother transitions during deployment updates.