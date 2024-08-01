FROM debian:bullseye-slim

EXPOSE 3306

# remove that folder to reduce the image size
RUN apt-get update && \
	apt-get install -y \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/config.sh /home/config.sh

RUN chmod 777 /home/config.sh

# will always be executed when the container starts
ENTRYPOINT ["/home/config.sh"]

# these are the default arguments passed to config.sh
CMD ["mysqld_safe", "--bind-address=0.0.0.0"]

# Notes for config.sh:
# mysql_secure_installation is to make a more secure installation
# <<-EOF is to ignore leading tabs
# '@'%' allows the user to connect from any host
# 'root'@'localhost' root user connecting from localhost
# MYSQL commands:
# mariadb -u root -p
# <mariadb root password>
# show databases;
# use <database>
# show tables;
# select * from <table>;
