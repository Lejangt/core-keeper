# Use Alpine Linux as the base image
FROM alpine:latest

# Set maintainer label
LABEL maintainer="Your Name <your.email@example.com>"

# Install dependencies and create the 'container' user
RUN apk add --no-cache --update curl ca-certificates openssl git tar bash unzip libc6-compat libgcc libstdc++ icu-libs \
    && adduser --disabled-password --home /home/container container

# Set environment variables
ENV USER=container HOME=/home/container

# Set the working directory
WORKDIR /home/container

# Switch to the 'container' user
USER container

# Download and set up the Core Keeper server
RUN curl -L -o CoreKeeperServer.zip "URL_TO_CORE_KEEPER_SERVER_FILE" && \
    unzip CoreKeeperServer.zip && \
    rm CoreKeeperServer.zip

# Copy the entrypoint script into the image
COPY ./entrypoint.sh /entrypoint.sh

# Set the command to run the entrypoint script
CMD ["/bin/bash", "/entrypoint.sh"]
