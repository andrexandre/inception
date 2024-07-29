FROM debian:bullseye-slim

EXPOSE 3306

RUN apt-get update && \
	apt-get install -y 
	mariadb-server && \
	rm -rf /var/lib/apt/lists/*
# remove that folder to reduce the image size

COPY ./tools/config.sh /tmp/config.sh

RUN chmod 777 /tmp/config.sh

# # will always be executed when the container starts
# ENTRYPOINT ["/tmp/config.sh"]

# # These are the default arguments passed to config.sh
# CMD ["mysqld_safe", "--bind-address=0.0.0.0"]
