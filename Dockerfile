# Base image
FROM perl:latest

# Install required Perl libraries
RUN cpan JSON::PP Digest::SHA

# Install curl and iproute2
RUN apt-get update && apt-get install -y curl iproute2

RUN mkdir -p /var/cache/ddclient/

# Set the working directory
WORKDIR /app

# Copy your application files to the container
COPY . .

# Set the entry point command
ENTRYPOINT [ "./ddclient", "-foreground" ]
