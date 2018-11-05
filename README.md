## initial setup
Edit stack.yml to pull brain and logic images from local registry

## running
```
docker-compose -f stack.yml up
```

## development & local docker registry
For local development, you'll want to be sure your stack.yml pulls image from local registry rather than docker hub (see instructions further down).

When you edit an app, be sure to rebuild the image, push it to the local registry, and pull down the new version:
<!-- https://docs.docker.com/registry/deploying/#copy-an-image-from-docker-hub-to-your-registry -->
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
cd to your app:
```
docker build . -t localhost:5000/my-app && docker push localhost:5000/my-app
docker-compose -f stack.yml pull && docker-compose -f stack.yml up
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

