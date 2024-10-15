# Use a base image with cron and bash
FROM ubuntu:latest

# Install cron
RUN apt-get update && apt-get -y install cron

# Copy the script
COPY sync.sh ./

# Copy the environment variables
COPY ../../.env ./

# Give execution rights on the script
RUN chmod +x ./sync.sh

# Create the log file to be able to write to it
RUN touch ./rclone.log

# Add the cron job using echo
RUN echo "0 3 * * * ~/sync.sh >> ~/rclone.log 2>&1" >> /etc/crontab

# Start the cron service
CMD ["cron", "-f"]

