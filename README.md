# Docker Demo
This project is meant to demonstrate docker-compose. We use a bunch of services (see services.yml) as well as a few apps (see apps.yml) to build a docker-compose application that lets you visit localhost:3000 and interact with a programmable logic device built out of docker containers and RabbitMQ messages.

Source code for apps:
* https://github.com/waltermblair/go-brain
* https://github.com/waltermblair/go-logic
* https://github.com/waltermblair/react

See Google slides for project details https://docs.google.com/presentation/d/1TZPJy1iXqKflsw8utwV5Iy6h-e4K2ANZMFpVc2hq8SQ/edit#slide=id.g460225b2dc_0_0

## initial setup
* Install docker
* Install docker-compose (included in Docker for Mac)

## running
```
docker-compose -f services.yml up
docker-compose -f apps.yml up
```
Go get a cup of coffee while everything downloads, and then find app at localhost:3000. To poke at the other apps and services that are running, check apps.yml and services.yml for what port they're using on localhost. For example, kibana is on localhost:5601

## development & local docker registry
For local development, you'll want to be sure your apps.yml pulls image from local registry rather than docker hub.

* Edit .env DOCKER_REGISTRY to pull brain, logic, and gui images from local registry 

When you edit an app, be sure to rebuild the image, push it to the local registry, and pull down the new version:
<!-- https://docs.docker.com/registry/deploying/#copy-an-image-from-docker-hub-to-your-registry -->
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
cd to your app:
```
docker build . -t localhost:5000/my-app && docker push localhost:5000/my-app
docker-compose -f apps.yml pull && docker-compose -f apps.yml up
```

