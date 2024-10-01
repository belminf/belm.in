IMAGE_NAME := belminf/personal_website:latest
DEPLOYMENT_NAME := personal-website

# Build, push and deploy
all: build push update-deployment

# Build image
build:
	sudo podman build -t $(IMAGE_NAME) .

# Push image to DockerHub
push:
	sudo podman push $(IMAGE_NAME) docker.io/$(IMAGE_NAME)

# Update the deployment to trigger pod recreation
update-deployment:
	kubectl scale deployment $(DEPLOYMENT_NAME) --replicas=0 && \
	kubectl scale deployment $(DEPLOYMENT_NAME) --replicas=2
