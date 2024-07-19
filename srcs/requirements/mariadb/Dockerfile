# Use the official MariaDB image as the base image
FROM mariadb

# Copy the .env file to the container
COPY ../../.env /usr/src/app/.env

# Copy the SQL script to initialize the database
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3306

# Set the environment variables for MariaDB and Start the MariaDB server
CMD ["sh", "-c", "source /usr/src/app/.env && mysqld"]
