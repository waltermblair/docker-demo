# Docker-Demo
## Services
| GUI        | localhost:3000                       |
| Brain      | localhost:8080/ping                  |
| Logic      | localhost:8081/ping                  |
| RabbitMQ   | localhost:15672                      |
| MySQL      | localhost:3306                       |
| phpmyadmin | localhost:8085                       |
| ELK        | localhost:9200/_search?pretty 		|

## initial setup
Edit stack.yml to pull gui, brain, and logic images from docker hub or from local registry (see below).
Note that for this intial setup, the db is force to initialize the db volume just so that we didn't have to check in all of those mysql files. We're running docker-compose once to initialize the db, copying the checked-in tables and pre-loaded data to the volume that was generated, and then restarting the container with the checked-in tables & data
```
docker-compose -f stack.yml pull && docker-compose -f stack.yml up
docker-compose down
cp -rf db-schema/* db/db-schema/
docker-compose -f stack.yml up
```
## running
```
docker-compose -f stack.yml up
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
curl localhost:5000/v2/_catalog
```
edit the stack.yml to pull from local registry rather than docker hub as needed

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

