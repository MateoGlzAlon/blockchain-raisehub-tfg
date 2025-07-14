# Use the official MySQL image
FROM mysql:latest

# Set environment variables (change these as needed)
ENV MYSQL_ROOT_PASSWORD=25DX0MR2CG
ENV MYSQL_DATABASE=crowdfund_db

# Copy the SQL dump file to the Docker image
COPY full_db.sql /docker-entrypoint-initdb.d/

# Expose MySQL port
EXPOSE 3306

# Run the default command
CMD ["mysqld"]
