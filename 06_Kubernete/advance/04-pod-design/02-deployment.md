# deployments

1. Deployment Creation and Rollout

When you create a deployment in Kubernetes, it manages the deployment's pods using replica sets. Here's an example YAML file (`deployment.yaml`) that defines a basic deployment:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.19.10
        ports:
        - containerPort: 80
```

Applying this file (`kubectl apply -f deployment.yaml`) will create a deployment named `nginx-deployment` with 3 replicas running nginx version 1.19.10.

2. Updating the Deployment

# Update via YAML File (`kubectl apply`)

Let's update the deployment to use a newer version of nginx (`nginx:1.21.3`). Modify `deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.21.3  # Updated image version
        ports:
        - containerPort: 80
```

Apply the changes:

```bash
kubectl apply -f deployment.yaml
```

# Update via `kubectl set image` Command

Alternatively, you can update the deployment's image directly using `kubectl set image`:

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.21.3
```

3. Rolling Update Strategy

During an update, Kubernetes uses a rolling update strategy to minimize downtime. Let's observe how it manages replica sets and pods:

- Before Update:
  ```
  Old Replica Set (Revision 1) | New Replica Set (empty)
  3 PODs                       | 0 PODs
  ```

- During Update (Incremental Pod Replacement):
  ```
  Old Replica Set (Revision 1) | New Replica Set (Revision 2)
  2 PODs                       | 1 POD
  ```

- After Update:
  ```
  Old Replica Set (Revision 1) | New Replica Set (Revision 2)
  0 PODs                       | 3 PODs
  ```

4. Rollback Process

If the new version (`nginx:1.21.3`) causes issues, you can rollback to the previous version (`nginx:1.19.10`):

```bash
kubectl rollout undo deployment/nginx-deployment
```

After the rollback, Kubernetes replaces pods from the latest revision with pods from the previous revision, ensuring the application reverts to its stable state.

 Summary of Commands

- Create Deployment: `kubectl apply -f deployment.yaml`
- Update Deployment: `kubectl apply -f deployment.yaml` or `kubectl set image ...`
- Check Rollout Status: `kubectl rollout status deployment/nginx-deployment`
- Rollback Deployment: `kubectl rollout undo deployment/nginx-deployment`

These commands and strategies ensure that Kubernetes deployments can be effectively managed, updated, and rolled back, maintaining high availability and reliability of applications running on Kubernetes clusters.

----

In Kubernetes, the deployment strategy (such as `RollingUpdate` or `Recreate`) is set within the deployment specification itself. Let's modify the example `deployment.yaml` to include the strategy and provide a detailed explanation.

## Example: Setting Deployment Strategy in `deployment.yaml`

Here's an updated `deployment.yaml` file that includes the deployment strategy:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 3
  strategy:
    type: RollingUpdate  # Specify the deployment strategy here
    rollingUpdate:
      maxUnavailable: 1  # Allow at most 1 unavailable pod during update
      maxSurge: 1        # Allow at most 1 additional pod above the desired number of replicas
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.19.10
        ports:
        - containerPort: 80
```

## Explanation:

- `strategy`: This section specifies the deployment strategy.
  - `type: RollingUpdate`: Indicates that Kubernetes should use the rolling update strategy for this deployment. This means it will update pods incrementally to minimize downtime.
  - `rollingUpdate`: Provides further configuration for the rolling update strategy.
    - `maxUnavailable`: Specifies the maximum number (or percentage) of pods that can be unavailable during the update process. Here, it's set to `1`, meaning at most 1 pod can be unavailable at any time.
    - `maxSurge`: Specifies the maximum number (or percentage) of pods that can be created above the desired number of pods (replicas). Here, it's set to `1`, allowing Kubernetes to temporarily create one additional pod above the desired number to speed up the update process.

## Applying the Deployment

To apply this deployment configuration, use the following command:

```bash
kubectl apply -f deployment.yaml
```

## Rollout and Strategy Verification

Once the deployment is applied, Kubernetes will manage updates according to the specified strategy (`RollingUpdate` in this case). You can monitor the rollout status and view the strategy in action using:

```bash
kubectl rollout status deployment/nginx-deployment
kubectl describe deployment nginx-deployment
```

## Conclusion

Setting the deployment strategy directly in the `deployment.yaml` file ensures that Kubernetes performs updates according to your specified preferences, whether it's rolling updates or recreating pods. This approach helps in maintaining application availability and stability during deployment updates.