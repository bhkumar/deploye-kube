FROM ubuntu:latest

LABEL maintainer="Bhupendra"
LABEL org.opencontainers.image.authors="Bhupendra Kumar"

# Install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create index.html
RUN printf '%s\n' \
    '<html>' \
    '<head><title>Apache Docker</title></head>' \
    '<body>' \
    '<h1>Welcome to Apache2 Docker Container</h1>' \
    '<p>Apache is running successfully!</p>' \
    '</body>' \
    '</html>' \
    > /var/www/html/index.html

# Expose Apache port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]