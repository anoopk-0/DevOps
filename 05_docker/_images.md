# Images:

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

## Mosty used Images CMD
Displays a list of locally available Docker images.
`docker images`

View all the images
`docker images -a`

To Remove dangling images / unrelated Images
`docker image prune`

Retrieves detailed information about an image
`docker image inspect <image_name>`

Remove an Image
`docker rmi <image_name>:<tag>`

-----------------------------

## Tags

Docker image tags are essentially labels applied to Docker images, allowing users to differentiate between different versions or variants of the same base image. Tags are specified using the format `<image>:<tag>`, where:

- `<image>` is the name of the Docker image.
- `<tag>` is the identifier attached to the image.

### Key Points about Docker Image Tags:

1. Default Tag: If no tag is specified when pulling an image, Docker uses the `latest` tag by default. For example, `ubuntu` is equivalent to `ubuntu:latest`.

2. Versioning: Tags are often used to denote different versions of an image. For instance, `ubuntu:18.04` and `ubuntu:20.04` represent different releases of the Ubuntu base image.

3. Additional Tags: Images can have multiple tags pointing to the same image. This is useful when different versions or aliases are required. For example, an image tagged `myapp:latest` might also be tagged `myapp:v1.0`, `myapp:prod`, etc.

4. Immutable Tags: Once an image is tagged and pushed to a registry, the content of that tag is immutable. This means that the image with a particular tag should always represent the same content, ensuring consistency.

5. Tagging Best Practices:
   - Use meaningful tags that reflect the purpose or version of the image.
   - Avoid using ambiguous tags like `latest` in production, as it can lead to unexpected updates.
   - Consider using semantic versioning (`semver`) for versioned tags (`v1.0.0`, `v1.1.0`).
   - Document tag meanings and update policies for clarity in team environments.

### Working with Tags:

Pulling Images: When pulling images, specify the tag to fetch a specific version. Example: `docker pull ubuntu:20.04`.

Pushing Images: When pushing images to a registry, specify the tag with `docker push`. Example: `docker push myregistry/myimage:v1.0`.

Listing Tags: You can list available tags for an image on a registry using commands like `docker image ls <repository>` or by visiting the registry's web interface.

### Example Use Case:

Suppose you have a Dockerfile for a web application. You might build and tag the image like this:

```bash
docker build -t myapp:v1.0 .
```

Then, you can push this image to a registry:
```bash
docker push myregistry/myapp:v1.0
```

Later, when deploying, you can specify this tagged image:

```bash
docker run -d myregistry/myapp:v1.0
```

POST build chaning tag

```bash
docker image tag <image_name/Id>:tag <image_name>:newTag
```

-------------------------------------

# Sharing Image

Sharing Docker images typically involves making them available to others who may need to use them, whether it's for development, testing, or deployment purposes. Here’s a guide on how to share Docker images effectively:

## Sharing Docker Images Locally:

Build the Docker Image:
   - First, ensure you have a Dockerfile that defines your image. You build the image using the `docker build` command. For example:
     ```bash
     docker build -t myimage:latest .
     ```

Tag the Image (Optional but Recommended):
   - Tagging the image helps identify versions or variants. By default, if no tag is specified, Docker uses `latest`. Example:
     ```bash
     docker tag myimage:latest myusername/myimage:latest
     ```

Share the Image:
   - To share an image locally, you can save it as a tar archive using `docker save` and then load it on another Docker environment using `docker load`.
     ```bash
     docker save myimage:latest > myimage.tar
     ```
     To load the image from the tar file:
     ```bash
     docker load < myimage.tar
     ```

## Sharing Docker Images via Docker Hub (Public Registry):

Push to Docker Hub:
   - Docker Hub is a popular public registry. First, log in to Docker Hub using `docker login`. Then, push your tagged image:
     ```bash
     docker push myusername/myimage:latest
     ```

Pull from Docker Hub:
   - To use the shared image, others can pull it from Docker Hub using `docker pull`:
     ```bash
     docker pull myusername/myimage:latest
     ```

## Sharing Docker Images via Private Registry:

Set Up a Private Registry:
   - If you have a private Docker registry (e.g., Docker Trusted Registry, AWS ECR, etc.), configure Docker to authenticate with it.

Push to Private Registry:
   - Tag your image for the private registry and push it similarly to Docker Hub:
     ```bash
     docker tag myimage:latest private-registry.example.com/myimage:latest
     docker push private-registry.example.com/myimage:latest
     ```

Pull from Private Registry:
   - Others can pull the image from the private registry by configuring Docker to authenticate and then using `docker pull`.

## Sharing Docker Images via Docker Compose:

- If your project involves multiple containers and dependencies, Docker Compose allows you to define and share multi-container Docker applications. You can use a `docker-compose.yml` file to define services, networks, and volumes.

### Best Practices:

- Versioning: Use meaningful tags (`latest`, `v1.0`, etc.) and avoid using `latest` for production.
- Security: Be mindful of what you share publicly and consider private registries for sensitive images.
- Documentation: Provide clear instructions on how to use your Docker image, including dependencies and configuration options.

# Save And Load

Saving and loading Docker images is useful for transferring images between different Docker environments or for backup purposes. Here’s how you can save an image to a file and load it back into Docker:

## Saving Docker Image to a File:

Save the Image:

   - Use the `docker save` command to save an image to a tar archive file. This command outputs the image's layers and metadata into a tarball.
     ```bash
     docker save -o myimage.tar myimage:tag
     ```

Verify the Saved File:

   - After running the command, you should see `myimage.tar` in your current directory or the specified output location.

## Loading Docker Image from a File:

Load the Image:
   - Use the `docker load` command to load an image from a tar archive file back into Docker. This command reads the tarball created by `docker save` and rebuilds the image with its layers and metadata.
     ```bash
     docker load -i myimage.tar
     ```
     The `-i` option specifies the input file (`myimage.tar` in this example).

Verify the Loaded Image:
   - Once the command completes, Docker will have loaded the image back into its local repository. You can verify this by listing Docker images:
     ```bash
     docker images
     ```
     The reloaded image should appear in the list.

## Example Workflow:

Let's say you want to save and load an Ubuntu image:

Save the Ubuntu Image:
   ```bash
   docker save -o ubuntu_image.tar ubuntu:20.04
   ```
   This command saves the `ubuntu:20.04` image to `ubuntu_image.tar`.

Load the Ubuntu Image:
   ```bash
   docker load -i ubuntu_image.tar
   ```
   This command loads the `ubuntu_image.tar` file back into Docker.

## Use Cases:

Migration: When moving Docker images between different environments or Docker hosts.

Backup and Restore: For creating backups of Docker images and restoring them when needed.

Sharing: When sharing Docker images with others who may not have direct access to a Docker registry.

### Notes:

Image Compatibility: Ensure that the Docker version and architecture (e.g., Linux distribution) are compatible when saving and loading images.

Size Consideration: Docker image tarballs can be large, especially for complex images with many layers.

------------------

