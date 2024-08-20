FROM debian:bullseye-slim

EXPOSE 443

RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl \
	&& rm -rf /var/lib/apt/lists/*

# create the folder for runtime data, such as pid, etc...
RUN mkdir -p /run/nginx

# req -x509: generate a request and self-sign the certificate
# -nodes: private key will not be encrypted
# -days 365: the certificate's validity period to 365 days
# -newkey rsa:2048: This generates a new key with a length of 2048 bits.
# -keyout/-out: where to save the key/certificate
# -subj "/C=...st/" details for the certificate:
# country (C), state (ST), locality (L), organization (O), organizational unit (OU), common name (CN)
RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/OU=analexan/CN=localhost/"

RUN chmod 777 /etc/nginx/ssl/server.crt /etc/nginx/ssl/server.key

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN chown -R www-data:www-data /var/www/html

# -g daemon off; serves nginx to run in the foreground
CMD ["nginx", "-g", "daemon off;"]
