#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_NAME" ]; then
	echo "Configuring MariaDB..."

	service mariadb start

	sleep 1

	mysql_secure_installation <<-END
	y
	$MYSQL_ROOT_PASSWORD
	$MYSQL_ROOT_PASSWORD
	y
	y
	y
	y
	END

	echo "MariaDB configured"
	echo "Creating Database..."

	mysql -u root <<-EOF
		CREATE DATABASE IF NOT EXISTS $MYSQL_NAME;
		CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
		GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
		FLUSH PRIVILEGES;
		ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
		FLUSH PRIVILEGES;
	EOF

    mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

	echo "Database created"
fi

echo "Starting MariaDB..."

exec "$@"