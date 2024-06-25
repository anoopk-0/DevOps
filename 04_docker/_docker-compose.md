# Docker Compose

To use Docker Compose instead of the `docker run` command for your scenario, you would typically create a `docker-compose.yml` file. This file allows you to define and manage multi-container Docker applications. In your case, where you have a single container application (`react-app:v4`), here’s how you would structure your `docker-compose.yml` file:

1. Create a `docker-compose.yml` file in your project directory:

```yaml
version: '3.8'  # You can adjust the version based on your Docker Compose installation

services:
  dev-app:
    image: react-app:v4  # Specify the image name and tag
    ports:
      - "8001:3000"  # Map host port 8001 to container port 3000
    volumes:
      - ${PWD}:/app  # Mount the current directory into /app directory in the container
    container_name: dev-app  # Assign a name to the container
```

2. Explanation of the `docker-compose.yml` file:
   - `version`: Specifies the version of Docker Compose syntax being used. Adjust as necessary.
   - `services`: Defines the services or containers that make up your application.
   - `dev-app`: Name of the service or container. You can choose any name you like.
     - `image`: Specifies the Docker image (`react-app:v4`) to use for this service.
     - `ports`: Maps host port `8001` to container port `3000`.
     - `volumes`: Mounts the current working directory (`${PWD}`) on the host to `/app` directory inside the container.
     - `container_name`: Assigns the name `dev-app` to the container.

3. Running with Docker Compose:
   - Navigate to the directory where your `docker-compose.yml` file is located.
   - Run `docker-compose up -d` to start the containers in detached mode (background).

This setup achieves the same functionality as your original `docker run` command but with the added benefits of managing your application configuration in a structured and reusable manner using Docker Compose.

------

## View Logs

```bash
    docker-compose logs
```