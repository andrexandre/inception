# Inception
This README.md is the first thing i learned in this project, this is how to work with a single docker container.

### First docker commands:
```
docker pull ubuntu
docker run -it ubuntu
```
> `-i` or `--interactive`: keeps STDIN open, this means that you can interact with the running container.  
`-t` or `--tty`: This option uses a TTY that allows you to interact with the running container as if it were a terminal.

with this you are inside a ubuntu container

if you do Ctrl+D or exit you stop the container

to see the current containers you use:

`docker ps -a`
> `-a` is to list all the containers (not only the actively running)

when you exit the container, it stops, but its still in memory, to remove it you use

`docker rm <NAME/CONTAINER ID>`

now you have it all cleaned up, almost exactly how it was before

exept that downloaded image that you pulled to the disk, in this case, ubuntu

to list the images in your disk you can do:

`docker images`

#### Other commands:

`docker build -t inception .`
> `-t` is to specify the name of the container

`docker run --name=inception -p 443:80 inception`
> 443 is an opened port on our pc and 80 is on the container

`docker stop inception`

`docker container prune -f`
> removes all stopped containers

`docker exec -it inception bash`
> enters into the container
