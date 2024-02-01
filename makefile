.PHONY: help build run debug remove

help:
	@echo "Available commands:"
	@echo "  make build             - Builds the development Docker image from the Dockerfile"
	@echo "  make run               - Runs the development container in detached mode"
	@echo "  make exec              - Accesses the running container using an interactive shell"
	@echo "  make remove            - Removes the running container and the built image"

.DEFAULT_GOAL := help

build:
	@if sudo docker images | grep -q "dark-nebula-frontend-image"; then \
		echo "Image exists. Removing..."; \
		sudo docker rmi -f dark-nebula-frontend-image; \
	else \
		echo "Image does not exist. Continuing..."; \
	fi
	sudo docker build -t dark-nebula-frontend-image . --no-cache

run:
	@if sudo docker ps -a | grep -q "dark-nebula-frontend-container"; then \
		echo "Container exists. Removing..."; \
		sudo docker rm -f dark-nebula-frontend-container; \
	else \
		echo "Container does not exist. Continuing..."; \
	fi
	sudo docker run -itd --name dark-nebula-frontend-container -p 3001:3000 dark-nebula-frontend-image

debug:
	sudo docker exec -it dark-nebula-frontend-container /bin/sh

remove:
	sudo docker rm -f dark-nebula-frontend-container
	sudo docker rmi -f dark-nebula-frontend-image