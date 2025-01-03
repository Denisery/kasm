# Use the Kasm base image
FROM kasmweb/core:1.13.0

# Set environment variables for Kasm
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

# Expose the default Kasm ports
EXPOSE 6901 5900 443

# Update and install additional required packages (if needed)
RUN apt-get update && apt-get install -y \
    curl \
    nano \
    vim \
    && apt-get clean

# Copy custom scripts or configurations if needed
# COPY ./custom-config.conf /etc/custom-config.conf

# Set the working directory
WORKDIR /home/kasm-user

# Run the Kasm server on startup
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
