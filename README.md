# Inception

This project aims to create a small containerized web infrastructure composed of different services under Docker.

## Services

This project uses the following Docker resources:

- Container with NGINX
- Container with WordPress + php-fpm
- Container with MariaDB
- Volumes for the WordPress database and website files
- Network to establish connection between containers

## Usage

1. Clone the repository
```sh
git clone https://github.com/andrexandre/inception.git ; cd inception
```

2. Setup and show how to use information
```sh
make
```

3. Create the folders for the volumes
```sh
make folders
```

4. Add the following line in the `/etc/hosts` file
```sh
127.0.0.1	analexan.42.fr
```
> It is possible to have a custom hostname by also editing [.env](srcs/.env) and [nginx.conf](srcs/requirements/nginx/conf/nginx.conf) 

3. Build and start the containers
```sh
make build-up
```
> If docker is not installed, you can install it by running:\
> `curl -fsSL https://get.docker.com | sudo sh`

4. Open the site in a browser
```sh
open https://analexan.42.fr
```

Clean up all docker resources
```sh
make prune
```

> [!NOTE]
> This project is part of the 42 School curriculum
