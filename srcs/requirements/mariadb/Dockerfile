# Use the official MariaDB image as the base image
FROM mariadb

# # Install MariaDB
# RUN apt-get update && \
#     apt-get install -y \
#     mariadb-server && \
#     rm -rf /var/lib/apt/lists/*
# remove that folder to reduce the image size

# # Expose the default MySQL port
# EXPOSE 3306

# Copy the .env file to the container
COPY ../../.env /usr/src/app/.env

# Copy the SQL script to initialize the database
COPY init.sql /docker-entrypoint-initdb.d/

# Set the environment variables for MariaDB and Start the MariaDB server
CMD ["sh", "-c", "source /usr/src/app/.env && mysqld"]
