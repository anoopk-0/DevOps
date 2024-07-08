# environment variables

To specify environment variables, we utilize the `env` property, which is an array. Each element in this array begins with a dash (`-`), indicating its position within the array. Each element consists of `name` and `value` properties. The `name` represents the variable's name within the container, while `value` holds its corresponding value.

Let's break this down with an example:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
    - name: mycontainer
      image: mydockerimage
      env:
        - name: ENV_VAR_NAME
          value: "example-value"
        - name: ANOTHER_VAR
          value: "another-value"
```

In the above example:
- We define a pod named `mypod` with a single container `mycontainer`.
- `mycontainer` uses the Docker image `mydockerimage`.
- Two environment variables are set using the `env` property: `ENV_VAR_NAME` with the value `"example-value"` and `ANOTHER_VAR` with the value `"another-value"`.

This straightforward approach directly sets environment variables using a simple key-value format. 
IMP: `However, Kubernetes also supports more advanced methods like ConfigMaps and Secrets for managing environment variables.`

When using ConfigMaps or Secrets, instead of specifying a direct `value`, you use `valueFrom` followed by a reference to the ConfigMap or Secret that contains the desired value. 

## ConfigMaps

### Environment Variables in Pod Definition

In a previous lecture, we discussed setting environment variables in a pod definition file. This method works well for managing a few variables but becomes cumbersome with multiple pod definition files.

### Introduction to ConfigMaps

ConfigMaps in Kubernetes are designed to centrally manage configuration data as key-value pairs. They are injected into pods so that these pairs are available as environment variables for applications running inside containers.

### Creating ConfigMaps

There are two approaches to creating ConfigMaps: imperative and declarative.

  1. Imperative Way

  You can create a ConfigMap directly from the command line using `kubectl create configmap` with the `--from-literal` option.

  **Example:**
  ```bash
  kubectl create configmap app-config --from-literal=app-color=blue
  ```

  You can add multiple key-value pairs using `--from-literal` multiple times.

  2. Declarative Way

  Alternatively, you can use a ConfigMap definition file which follows a structure similar to other Kubernetes objects.

  **Example YAML Definition (`app-config.yaml`):**
  ```yaml
  apiVersion: v1
  kind: ConfigMap
  metadata:
    name: app-config
  data:
    app-color: blue
    app-size: large
  ```

  To create this ConfigMap, use:
  ```bash
  kubectl create -f app-config.yaml
  ```

### Viewing ConfigMaps

To list all ConfigMaps:
```bash
kubectl get configmaps
```

To view details of a specific ConfigMap:
```bash
kubectl describe configmap app-config
```

### Injecting ConfigMaps into Pods

Once ConfigMaps are created, they can be injected into pods to provide environment variables.

#### Example Pod Definition (`app-pod.yaml`):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  containers:
    - name: myapp-container
      image: myapp:v1
      envFrom:
        - configMapRef:
            name: app-config
```

In this example:
- `envFrom` is used to inject environment variables from the `app-config` ConfigMap into the `myapp-container`.
- This allows the application to access variables like `app-color` and `app-size`.

### Conclusion

ConfigMaps offer a flexible way to manage configuration data in Kubernetes, enhancing scalability and maintainability. Beyond environment variables, Kubernetes provides various methods like injecting data as single variables or entire files in volumes.

# Secrets


Let's begin with an example application: a Python web app that connects to a MySQL database. When successful, it displays a "Successful" message. However, a closer look at the code reveals that the hostname, username, and password are hard-coded directly into the application. Clearly, storing sensitive information like passwords in plaintext within your codebase is not a good practice.

 one solution is to use ConfigMaps for configuration data. However, ConfigMaps store data in plaintext, making them unsuitable for storing passwords securely. This is where Kubernetes Secrets come into play.

Secrets are designed to store sensitive information securely within Kubernetes. Unlike ConfigMaps, Secrets store data in an encoded format. 

Let's delve into how we create and manage Secrets in Kubernetes.
### Creating Secrets

There are two methods for creating Secrets: Imperative and Declarative.

  1. Imperative Method

  The Imperative method allows us to create Secrets directly via the command-line. We use the `kubectl create secret generic` command followed by the `--from-literal` option to specify key-value pairs directly in the command. For example:

  ```bash
  `kubectl create secret generic app-secret --from-literal=DB_Host=mysql`
  ```

  For more key-value pairs, use `--from-literal` multiple times. However, this can become cumbersome with many Secrets.

  Alternatively, you can use the `--from-file` option to specify a path to a file containing the Secret data. The data from this file is read and stored securely.

  2. Declarative Method

  In the Declarative approach, we define a YAML file (`secret.yaml`) specifying the Secret details:

  ```yaml
  apiVersion: v1
  kind: Secret
  metadata:
    name: app-secret
  data:
    DB_Host: bXlzcWw=  # Base64 encoded value for 'mysql'
  ```
   
  CMD: `echo -n "mysql" | base64` 

  Notice that values such as `bXlzcWw=` represent the Base64 encoded form of sensitive data, ensuring it is not stored in plaintext.

### Managing Secrets

Once created, you can manage Secrets by viewing them using `kubectl get secrets`. To display more detailed information while hiding sensitive values, use `kubectl describe secret`.

### Using Secrets in Pods

To use Secrets within Pods, we can inject them as environment variables or mount them as files:

#### Injecting as Environment Variables

Modify your Pod definition file (`pod.yaml`) to include the Secrets:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  containers:
    - name: myapp-container
      image: myapp-image
      envFrom:
        - secretRef:
            name: app-secret
```

This injects all key-value pairs from `app-secret` into the Pod's environment.

#### Mounting as Files

Alternatively, mount Secrets as files within a volume:

```yaml
volumes:
  - name: secret-volume
    secret:
      secretName: app-secret
```

Each attribute in the Secret becomes a file within the Pod, securing access to individual secrets.

### Security Considerations

It's crucial to remember that Kubernetes Secrets are not encrypted by default. They are encoded, not encrypted, and can be decoded easily if accessed. Therefore, avoid committing Secret definition files (`secret.yaml`) alongside your code in version control repositories like GitHub.

Additionally, access to Secrets within a namespace is granted to anyone who can create Pods or Deployments within that namespace. Consider implementing role-based access control (RBAC) to restrict access and improve security.

For advanced security needs, consider using third-party Secret providers like AWS, Azure, Google Cloud, or Vault. These providers offer enhanced security features and can manage Secrets outside of Kubernetes' ETCD storage.

IMP Resoure: https://www.youtube.com/watch?v=MTnQW9MxnRI&ab_channel=KodeKloud

-----------------------

