# Inception
This README.md is my notes for the inception project that you can use as documentation.

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

...

docker0 is the virtual bridge interface.

docker network ls
DRIVER = network type

docker network create <name>


WIP




Other commands:

docker build -t inception .

docker run inception

docker container prune -f
> removes all stopped containers

docker run -p 8080:80 inception
