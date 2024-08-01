FROM debian:bullseye-slim

EXPOSE 443

RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*

# create the folder for runtime data, such as pid, etc...
RUN mkdir -p /run/nginx

# create ssl certificate and key
RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/OI=analexan/CN=localhost/"

RUN chmod 777 /etc/nginx/ssl/server.crt /etc/nginx/ssl/server.key

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]
