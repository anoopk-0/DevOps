# Docker Commands

Some of the most commonly used docker commands are 

### docker images

Lists docker images on the host machine.

### docker build

Builds image from Dockerfile.

### docker run

Runs a Docker container. 

There are many arguments which you can pass to this command for example,

`docker run -d` -> Run container in background and print container ID
`docker run -p` -> Port mapping

use `docker run --help` to look into more arguments.

### docker ps

Lists running containers on the host machine.

### docker stop

Stops running container.

### docker start

Starts a stopped container.

### docker rm

Removes a stopped container.

### docker rmi

Removes an image from the host machine.

### docker pull

Downloads an image from the configured registry.

### docker push

Uploads an image to the configured registry.

### docker exec

Run a command in a running container.

### docker network

Manage Docker networks such as creating and removing networks, and connecting containers to networks.

------------------------------

Certainly! Docker commands are used via the Docker CLI (Command Line Interface) to manage Docker containers, images, networks, volumes, and other resources. Here are some of the most commonly used Docker commands categorized by their functionality:

### Managing Containers

- **Create a new container:**
  ```
  docker create [options] IMAGE [command] [args]
  ```
  
- **Run a command in a new container:**
  ```
  docker run [options] IMAGE [command] [args]
  ```
  
- **Start a stopped container:**
  ```
  docker start [options] CONTAINER
  ```
  
- **Stop a running container:**
  ```
  docker stop [options] CONTAINER
  ```
  
- **Restart a container:**
  ```
  docker restart [options] CONTAINER
  ```
  
- **List running containers:**
  ```
  docker ps [options]
  ```
  
- **List all containers (including stopped):**
  ```
  docker ps -a [options]
  ```
  
- **Attach to a running container:**
  ```
  docker attach [options] CONTAINER
  ```
  
- **Execute a command in a running container:**
  ```
  docker exec [options] CONTAINER COMMAND [ARGS...]
  ```
  
- **Remove a container:**
  ```
  docker rm [options] CONTAINER
  ```
  
- **Inspect container details:**
  ```
  docker inspect [options] CONTAINER
  ```

### Managing Images

- **List downloaded images:**
  ```
  docker images [options]
  ```
  
- **Pull an image from a registry:**
  ```
  docker pull IMAGE[:TAG]
  ```
  
- **Build an image from a Dockerfile:**
  ```
  docker build [options] PATH | URL | -
  ```
  
- **Remove an image:**
  ```
  docker rmi [options] IMAGE
  ```
  
- **Inspect image details:**
  ```
  docker image inspect [options] IMAGE
  ```

### Managing Networks

- **List networks:**
  ```
  docker network ls [options]
  ```
  
- **Create a new network:**
  ```
  docker network create [options] NETWORK_NAME
  ```
  
- **Connect a container to a network:**
  ```
  docker network connect [options] NETWORK CONTAINER
  ```
  
- **Disconnect a container from a network:**
  ```
  docker network disconnect [options] NETWORK CONTAINER
  ```

### Managing Volumes

- **List volumes:**
  ```
  docker volume ls [options]
  ```
  
- **Create a new volume:**
  ```
  docker volume create [options] VOLUME_NAME
  ```
  
- **Remove a volume:**
  ```
  docker volume rm [options] VOLUME_NAME
  ```
  
- **Inspect volume details:**
  ```
  docker volume inspect [options] VOLUME_NAME
  ```

### Docker System Management

- **Display Docker system-wide information:**
  ```
  docker info
  ```
  
- **Display Docker disk usage:**
  ```
  docker system df
  ```
  
- **Prune unused objects (containers, images, networks, volumes):**
  ```
  docker system prune [options]
  ```
  
- **Monitor Docker events:**
  ```
  docker events [options]
  ```
  
- **Manage Docker logs:**
  ```
  docker logs [options] CONTAINER
  ```

### Docker Compose (for managing multi-container applications)

- **Start containers defined in a Docker Compose file:**
  ```
  docker-compose up [options]
  ```
  
- **Stop and remove containers defined in a Docker Compose file:**
  ```
  docker-compose down [options]
  ```

### Example Usage:

- **Run a Redis container:**
  ```
  docker run --name my-redis -d redis
  ```

- **Build an image from a Dockerfile:**
  ```
  docker build -t my-app .
  ```

- **List all containers:**
  ```
  docker ps -a
  ```

- **Inspect container details:**
  ```
  docker inspect my-redis
  ```

These are some of the fundamental Docker commands used for managing containers, images, networks, volumes, and the Docker system itself. Each command has various options and flags that provide additional functionality and control over Docker resources.