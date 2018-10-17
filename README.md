## running
```
docker-compose -f stack.yml pull && docker-compose -f stack.yml up
```

## local docker registry
<!-- https://docs.docker.com/registry/deploying/#copy-an-image-from-docker-hub-to-your-registry -->
```
docker run -d -p 5000:5000 --restart=always --name registry registry:2
```
or for stable volume:
```
docker run -d -p 5000:5000 --restart=always --name registry -v /mnt/registry:/var/lib/registry registry:2
```
cd to your app:
```
docker build . -t localhost:5000/my-app && docker push localhost:5000/my-app
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

