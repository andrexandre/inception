FROM debian:bullseye-slim

EXPOSE 9000

RUN apt-get update && \
	apt-get install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wget \
	&& rm -rf /var/lib/apt/lists/*

# wp-cli is a cli that makes the process of configuring wp easier and automatically
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# create the folder for runtime data, such as pid, etc... (php bug)
RUN mkdir -p /run/php/ && chmod 755 /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/config.sh /home

RUN chmod 777 /home/config.sh

ENTRYPOINT ["/home/config.sh"]

# start the php-FastCGI Process Manager in the background
CMD ["php-fpm7.4", "-F"]
