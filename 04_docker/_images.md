# Images && Container

The terms "images" and "containers" are fundamental concepts in the context of containerization technologies like Docker. Here's a breakdown of what each term means and how they relate to each other:

## Images:

Definition: An image is a lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, runtime, libraries, and dependencies.
  
  - Characteristics:

    - Immutable: Images are typically immutable, meaning once created, they are not changed but rather replaced when updated or modified.
    - Layered: Images are composed of multiple layers. Each layer represents a set of filesystem changes (e.g., file additions, modifications, deletions).
    - Portable: Images can be shared and distributed across different environments running containerization platforms.

  - Usage:

    - Images serve as a blueprint for creating containers. They define the environment and configurations required to run an application or service.
    - Images are typically built using a Dockerfile, which specifies instructions to assemble the image layer by layer.

Example: You might have an image that contains a web server, along with the necessary files and configurations to serve a website.

## Containers:

Definition: A container is a runtime instance of an image. It represents a runnable instance of an image, with its own isolated filesystem, network, and process space.

  - Characteristics:

    - Lightweight: Containers share the host system’s kernel and use resources efficiently, making them lightweight compared to virtual machines.
    - Isolated: Containers provide process and filesystem isolation, allowing multiple containers to run on the same host without interfering with each other.
    - Portable: Like images, containers are portable across different containerization platforms as long as they are compatible with the underlying runtime.

  - Usage:

    - Containers are instantiated from images using container runtime engines such as Docker Engine, containerd, or Kubernetes.
    - Each container runs as an isolated process, encapsulating the application and its dependencies, providing consistency in deployment and execution environments.

Example: Using the previously mentioned web server image, you can create multiple containers from this image, each running its own instance of the web server, potentially serving different applications or versions.

## Relationship:

`Image to Container`: An image serves as a template or blueprint for creating one or more containers. You can create multiple containers from the same image, each with its own isolated runtime environment.

`Lifecycle`: Images are typically built, stored in a registry (like Docker Hub), pulled to a host machine, and then used to create containers. Containers are ephemeral instances that can be started, stopped, and deleted as needed.

NOTE: In summary, images are static, immutable templates that define the environment and configuration of applications, while containers are dynamic, runnable instances of those images, providing the actual runtime environments for applications in isolated and lightweight environments.

------------------------
