#!/bin/bash

sleep 5

if [ ! -e "/var/www/html/wp-config.php" ]; then
	echo "Configuring WordPress..."

	cd "$WP_PATH"

	wp core download --allow-root

	wp config create --allow-root \
					--dbname=$MYSQL_NAME \
					--dbuser=$MYSQL_USER \
					--dbpass=$MYSQL_PASSWORD \
					--dbhost=$WP_HOST \
					--path=$WP_PATH

	wp core install --allow-root \
				--url="$WP_URL" \
				--title="$WP_TITLE" \
				--admin_user="$WP_ADMIN_USER" \
				--admin_password="$WP_ADMIN_PASSWORD" \
				--admin_email="$WP_ADMIN_EMAIL" \
				--skip-email

	wp user create --allow-root \
					"$WP_SECOND_USER" \
					"$WP_SECOND_USER_EMAIL" \
					--role=author \
					--user_pass="$WP_SECOND_USER_PASSWORD"

	wp theme activate twentytwentyfour --allow-root

	chown -R www-data:www-data /var/www/html

	echo "WordPress configured successfully"
fi

echo "Starting WordPress..."

exec "$@"
