# Introduction to Kubernetes Deployments

In Kubernetes, deployments are a fundamental resource for managing the deployment, scaling, and updating of applications. They provide a declarative way to define and manage application lifecycles, ensuring consistency, reliability, and operational efficiency in production environments.

![alt text](../images/deployment.png)

## Example Application: Deploying Nginx with Kubernetes Deployments

Let's deploy a simple Nginx web server using Kubernetes deployments as an example.

## Step-by-Step Explanation and Commands

## 1. Defining the Deployment Configuration

Create a YAML file `nginx-deployment.yaml` to define the deployment configuration:

```yaml
apiVersion: apps/v1
kind: Deployment # this is the only change
metadata:
  name: nginx-deployment
spec:
  replicas: 3  # Number of replicas (pods) to run
  selector:
    matchLabels:
      app: nginx  # Label selector for pods managed by this deployment
  template:
    metadata:
      labels:
        app: nginx  # Labels applied to pods created by this deployment
    spec:
      containers:
      - name: nginx
        image: nginx:latest  # Docker image to deploy
        ports:
        - containerPort: 80  # Port exposed by the container
```

`Explanation`:
- `apiVersion`: Specifies the API version (`apps/v1`) for deployments.
- `kind`: Defines the type of Kubernetes resource (`Deployment`).
- `metadata`: Contains metadata like the name of the deployment.
- `spec`: Specifies the deployment's desired state.
  - `replicas`: Number of identical pods that should be running (`3` in this case).
  - `selector`: Specifies how the deployment identifies which pods are managed by it.
  - `template`: Defines the pod template used to create new pods.
    - `metadata.labels`: Labels applied to the pods created by this template (`app: nginx`).
    - `spec.containers`: Specifies the containers within each pod.
      - `name`: Name of the container (`nginx`).
      - `image`: Docker image to use for the container (`nginx:latest`).
      - `ports`: Ports to expose from the container to the outside world (`80`).

## 2. Deploying the Application

Apply the deployment configuration to the Kubernetes cluster using the following command:

```bash
kubectl apply -f nginx-deployment.yaml
```

This command deploys the Nginx application according to the configuration specified in `nginx-deployment.yaml`.

## 3. Managing and Monitoring Deployments

After deploying the application, use the following commands to manage and monitor the deployment:

- `Check Deployment Status`:
  ```bash
  kubectl get deployments
  ```

- `View Deployment Details`:
  ```bash
  kubectl describe deployment nginx-deployment
  ```

- `List Pods Created by the Deployment`:
  ```bash
  kubectl get pods -l app=nginx
  ```

## Key Features Illustrated:

- `Rolling Updates`: Controlled deployment of new versions without downtime.
- `Rollbacks`: Revert to previous stable versions in case of issues.
- `Scalability`: Easily scale application replicas up or down based on demand.

## Conclusion

Kubernetes deployments are essential for managing containerized applications efficiently in Kubernetes clusters. They automate deployment tasks, ensure application availability and scalability, and provide mechanisms for controlled updates and rollbacks. By leveraging deployments, DevOps teams can maintain reliable and resilient applications in production environments effectively.

Deployments are foundational in Kubernetes, aligning with best practices for modern cloud-native application deployment strategies. They streamline operations, enhance reliability, and support agile development practices, making them a cornerstone of Kubernetes application management.


-----------------------

# Version and Rollout

When you create a Kubernetes deployment, it triggers a rollout, which initiates a new deployment revision. 

For example:
- Initial deployment creates `Revision 1`.
- Subsequent updates (e.g., updating container versions) trigger new rollouts and create new revisions (e.g., `Revision 2`).

These revisions help track changes made to the deployment and facilitate rollback operations if required.

## Commands for Managing Deployments

1. `Check Rollout Status`:
   To monitor the progress of a rollout, use:
   
   ```bash
   kubectl rollout status deployment/<deployment_name>
   ```
   This command provides real-time updates on the status of the deployment rollout.

2. `View Rollout History`:
   To see the history of revisions and rollouts:

   ```bash
   kubectl rollout history deployment/<deployment_name>
   ```
   This command lists all revisions and their deployment history.

## Deployment Strategies

There are two primary deployment strategies:

- `Recreate Strategy`: Destroys all existing pods before creating new ones. This can cause downtime.
  
- `Rolling Update Strategy`: Updates pods gradually, one at a time, ensuring the application remains available throughout the update process. This is the default strategy in Kubernetes.

---

## Performing Updates

To update a deployment, modify the deployment definition file (`deployment.yaml`) and apply changes using:
```bash
kubectl apply -f deployment.yaml
```
Alternatively, you can update the image directly using:
```bash
kubectl set image deployment/<deployment_name> <container_name>=<new_image_version>
```
Be cautious with this method as it modifies the deployment configuration directly.

-----


## Deployment Rollbacks

If an update introduces issues and you need to revert to a previous version:
```bash
kubectl rollout undo deployment/<deployment_name>
```
This command rolls back the deployment to the previous stable state, restoring the previous set of pods.

## Under the Hood: How Updates Work

When you update a deployment, Kubernetes creates a new replica set for the updated version while gradually scaling down the old replica set. This rolling update strategy ensures minimal downtime and continuous availability of the application.

## Example Scenario

Let's say you update your application to a new version but encounter issues. To rollback:
```bash
kubectl rollout undo deployment/<deployment_name>
```
This command reverses the deployment to the previous replica set configuration.

----

## Summary of Commands

- Create Deployment: `kubectl create -f deployment.yaml`
- List Deployments: `kubectl get deployments`
- Apply Changes: `kubectl apply -f deployment.yaml`
- Update Image: `kubectl set image deployment/<deployment_name> <container_name>=<new_image_version>`
- Rollout Status: `kubectl rollout status deployment/<deployment_name>`
- Rollback Deployment: `kubectl rollout undo deployment/<deployment_name>`

---

### Conclusion

In conclusion, Kubernetes deployments provide powerful tools for managing application updates and maintaining continuous availability. By leveraging deployment strategies and rollback capabilities, Kubernetes ensures seamless operations and rapid recovery from issues. Understanding these concepts and commands is essential for effective application management in Kubernetes environments.

Deployments in Kubernetes are foundational for modern DevOps practices, enabling teams to deploy, scale, update, and rollback applications with confidence and efficiency.

