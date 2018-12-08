# Docker Demo
See Google slides for project info https://docs.google.com/presentation/d/1TZPJy1iXqKflsw8utwV5Iy6h-e4K2ANZMFpVc2hq8SQ/edit#slide=id.g460225b2dc_0_0

## initial setup
Install docker . 
Install docker-compose (included in Docker for Mac) . 
Edit .env DOCKER_REGISTRY to pull brain, logic, and gui images from local registry or github

## running
```
docker-compose -f services.yml up
docker-compose -f apps.yml up
```
find app at localhost:3000

## development & local docker registry
For local development, you'll want to be sure your apps.yml pulls image from local registry rather than docker hub (see instructions further down).

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

## docker logging
this is where logs are stored on the vm:
```
docker inspect --format='{{.LogPath}}' containername
```
to get to vm:
```
screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
cd ../var/lib/docker/
```

