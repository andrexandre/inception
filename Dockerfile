FROM nginx
# FROM debian:11

# WORKDIR /app

COPY . /usr/share/nginx/html
