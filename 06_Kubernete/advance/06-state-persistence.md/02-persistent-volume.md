# Persistent Volumes in Kubernetes

Persistent Volumes (PVs) are a cluster-wide resource that provide storage in a way that's decoupled from the life cycle of any individual pod. They allow administrators to provision storage resources and enable users (developers or application operators) to consume these resources without needing to know the underlying details of where the storage is located or how it's configured.

#### Example Scenario

Imagine you have a Kubernetes cluster where you want to manage storage centrally and provide it to applications as needed. Here’s how you would create a Persistent Volume step-by-step:

1. **Define a Persistent Volume (PV)**

   ```yaml
   apiVersion: v1
   kind: PersistentVolume
   metadata:
     name: pv-vol-one
   spec:
     capacity:
       storage: 1Gi
     accessModes:
       - ReadWriteOnce
     hostPath:
       path: /data/pv-vol-one
   ```

   - **Explanation:**
     - **Name (`pv-vol-one`)**: Unique name for the Persistent Volume.
     - **Capacity**: Specifies the amount of storage (1GiB in this case).
     - **Access Modes**: Defines how the volume can be mounted. `ReadWriteOnce` means the volume can be mounted as read-write by a single node.
     - **Host Path**: Uses storage from the local node's filesystem (`/data/pv-vol-one`). Note: `hostPath` is typically used for development or testing, not recommended for production.

2. **Create the Persistent Volume**

   Use `kubectl create` command to create the Persistent Volume:

   ```
   kubectl create -f pv-definition.yaml
   ```

3. **Verify Persistent Volume**

   To list all Persistent Volumes:

   ```
   kubectl get persistentvolumes
   ```

#### Diagram Explanation

Here’s a diagram to illustrate how Persistent Volumes work in Kubernetes:

```
                               +------------------+
                               |   Persistent     |
                               |   Volume (PV)    |
                               |     (1GiB)       |
                               |                  |
                               |  Access Modes:    |
                               |  ReadWriteOnce    |
                               +------------------+
                                       |
                                       |
                          +--------------+--------------+
                          |                             |
                          |                             |
                   +------+------+                +-------+------+
                   |  Pod A       |               |  Pod B       |
                   |  Container   |               |  Container   |
                   |  Volume Mount|               |  Volume Mount|
                   +--------------+               +--------------+
```

- **Persistent Volume (PV)**: Represents the actual storage resource provisioned in the cluster.
- **Pod A and Pod B**: Applications or Pods that need persistent storage.
- **Volume Mount**: Mounts the Persistent Volume to the Pods where data can be read from or written to.

### Summary

Persistent Volumes in Kubernetes enable administrators to manage storage centrally and allow developers to claim and use storage resources without worrying about underlying infrastructure details. This separation of concerns simplifies management and enhances flexibility in deploying applications that require persistent storage.

In the next lecture, we will explore how Persistent Volume Claims (PVCs) are used to request and bind Persistent Volumes to pods or applications.


--------------------

# Persistent Volume Claim

#### Step 1: Create a Persistent Volume (PV)

First, we need to have a Persistent Volume (PV) available. Here’s an example of a PV definition:

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  persistentVolumeReclaimPolicy: Retain
  storageClassName: manual
  hostPath:
    path: "/data/my-pv"
```

In this example:
- `capacity`: Specifies the storage capacity of the volume (`1Gi` in this case).
- `accessModes`: Defines the access mode (`ReadWriteOnce` allows read-write access by a single node).
- `persistentVolumeReclaimPolicy`: Defines what happens to the PV after the PVC using it is deleted (`Retain` retains the volume).
- `storageClassName`: Associates the PV with a specific storage class (`manual` in this example).
- `hostPath`: Represents a directory on the host machine's filesystem.

#### Step 2: Create a Persistent Volume Claim (PVC)

Now, let’s create a PVC that requests storage from the PV we defined:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-claim
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
  storageClassName: manual
```

In this PVC definition:
- `accessModes`: Specifies the access mode required (`ReadWriteOnce`).
- `resources.requests.storage`: Requests `500Mi` (500 megabytes) of storage.
- `storageClassName`: Matches the storage class defined in the PV.

#### Step 3: Binding the PVC to the PV

Once the PVC is created, Kubernetes will bind it to a suitable PV based on its requirements (capacity, access mode, storage class). If there’s a matching PV available (`my-pv` in this case), Kubernetes will bind `my-claim` to `my-pv`.

#### Diagram Overview

Here’s a simplified diagram illustrating the relationship between PVs, PVCs, and Kubernetes nodes:

```
           +---------------------+
           |   Persistent Volume |
           |       (my-pv)       |
           +---------------------+
                    |
                    | Binds to
                    |
           +---------------------+
           | Persistent Volume   |
Kubernetes |     Claim (my-claim)|
 Cluster   +---------------------+
                    |
                    | Manages
                    |
           +---------------------+
           |     Kubernetes      |
           |         Node         |
           +---------------------+
```

### Cleanup: Deleting PVCs and PVs

When deleting a PVC (`kubectl delete persistentvolumeclaim my-claim`), the associated PV (`my-pv`) will behave according to its `persistentVolumeReclaimPolicy`:
- `Retain` (default): PV remains intact and must be manually deleted.
- `Delete`: PV is deleted along with the PVC.
- `Recycle` (deprecated): PV is scrubbed (not typically used in modern Kubernetes).

### Conclusion

Understanding how Persistent Volumes and Persistent Volume Claims work in Kubernetes is crucial for managing storage effectively within your cluster. The relationship ensures that applications have reliable access to persistent storage and that resources are managed efficiently.

Feel free to practice these concepts in your Kubernetes environment to gain hands-on experience with PVs and PVCs.