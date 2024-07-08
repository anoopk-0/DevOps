# Security Context

Let's start by considering a host with Docker installed. This host runs various processes including the Docker daemon, system services, and more. When we run a Docker container, it shares the host's kernel but uses Linux namespaces for isolation.

### Process Isolation

Containers are not completely isolated like virtual machines. Instead, they share the same kernel but have their own namespaces. This means processes within a container are isolated within their namespace and cannot directly interact with processes outside of it. For instance:

```bash
docker run -d ubuntu sleep 3600
```

When we list processes within the Docker container, we see:
```bash
$ docker exec -it <container_id> ps aux
PID   USER     TIME   COMMAND
  1   root     0:00   sleep 3600
```

On the host, the same process might appear with a different PID:
```bash
$ ps aux | grep sleep
PID   USER     TIME   COMMAND
1234  root     0:00   sleep 3600
```

This demonstrates how Docker isolates processes using Linux namespaces.

### User Management

By default, Docker runs processes within containers as the root user. This can pose security risks. To mitigate this, you can specify a different user using Docker's `--user` option:

```bash
docker run --user 1000 ubuntu sleep 3600
```

Alternatively, you can define the user within the Docker image itself during its creation using the `USER` instruction in the Dockerfile:

```dockerfile
FROM ubuntu
USER 1000
CMD ["sleep", "3600"]
```

### Root User Limitations

Running containers as the root user within the container does not grant the same privileges as the root user on the host. Docker utilizes Linux capabilities to restrict what actions a container's root user can perform. These capabilities control actions such as:

- Modifying file permissions
- Creating or killing processes
- Network operations
- System-level operations

Docker restricts these capabilities by default to enhance security.

### Managing Linux Capabilities

You can control and limit capabilities available to a container using Docker's capabilities flags:

- **Adding capabilities**: Use `--cap-add` to grant additional privileges:
  ```bash
  docker run --cap-add SYS_ADMIN ubuntu
  ```

- **Dropping capabilities**: Use `--cap-drop` to remove specific privileges:
  ```bash
  docker run --cap-drop CHOWN ubuntu
  ```

- **Privileged mode**: Use `--privileged` to give a container full access to the host's devices:
  ```bash
  docker run --privileged ubuntu
  ```

### Conclusion

In summary, Docker provides robust security features through Linux namespaces and capabilities to ensure containers are isolated and secure by default. Understanding these concepts is crucial for deploying applications safely in containerized environments.

----------------

# Security containers running in Kubernetes.

In Docker, when you run a container, you can specify security measures such as the user ID and Linux capabilities. Similarly, Kubernetes allows us to configure these settings either at the pod level or at the individual container level.

In Kubernetes, containers are encapsulated within pods. If you set security configurations at the pod level, they apply to all containers within that pod. However, if you configure security settings at both the pod and container levels, the container-level settings will take precedence.

Let's look at a practical example with a pod definition file:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-sleeper
spec:
  containers:
  - name: ubuntu-container
    image: ubuntu
    command: ["sleep", "3600"]
    securityContext:
      runAsUser: 1000
      capabilities:
        add: ["NET_ADMIN", "SYS_TIME"]
```

In this example:

- We define a pod named `ubuntu-sleeper` that runs a container using the Ubuntu image with a sleep command (`sleep 3600`).
- Under the `spec` section of the pod definition, within the `containers` field, we specify `securityContext` to set security configurations.
- `runAsUser: 1000` sets the user ID (UID) for the pod to 1000.
- `capabilities` specifies additional Linux capabilities (`NET_ADMIN` and `SYS_TIME`) to be added to the pod.

Remember, these settings ensure that our Kubernetes pods and containers adhere to specific security standards, enhancing the overall security posture of our applications.

----------------
