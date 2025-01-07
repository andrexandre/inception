FROM debian:bullseye-slim

EXPOSE 9000

RUN apt-get update && \
	apt-get install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	wget \
	&& rm -rf /var/lib/apt/lists/*

# wp-cli is a cli that makes the process of configuring wp easier and automatically
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# create the folder for runtime data, such as pid, etc...
RUN mkdir -p /run/php/ && chmod 755 /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/config.sh /home

RUN chmod 777 /home/config.sh

ENTRYPOINT ["/home/config.sh"]

# start the php-FastCGI Process Manager in the background
CMD ["php-fpm7.4", "-F"]

# Notes for config.sh:
# chown - change ownership, -R - recursive
# www-data:www-data - <user>:<group>
# WIP - maybe remove some of the lines in www.conf
# mandatory - listen, user, pm, pm.max_children
# Notes for www.conf:
# user - user of FPM processes
# listen - address on which to accept FastCGI requests
# pm - how the pm will control the number of child processes
# pm.start_servers - number of child processes created on startup
# pm.min/max_spare_servers - min/max number of idle server processes
# clear_env - clear the env in pm processes