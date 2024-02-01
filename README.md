# Dark Nebula Frontend

This repository contains the code for the frontend part of Dark Nebula, which uses Docker for containerized deployment.

## Quick Start

The following commands are available for building and managing the Docker container.

### Build Image

Run this command to build the development Docker image from the `Dockerfile`.

```bash
make build
```

If the image already exists, this command will remove the existing image before building a new one.

### Run Container

Use the following command to run the development container. This will start the container in detached mode and map the container's port 3000 to the local port 3001.

```bash
make run
```

If the container already exists, it will be removed and a new one will be created.

### Enter Container

If you need to debug or execute some commands, you can use the following command to access the running container.

```bash
make debug
```

This will open an interactive shell for you to operate within the container.

### Remove Container and Image

To stop and remove the container and its image, execute:

```bash
make remove
```

This will remove both the container and the built Docker image.
