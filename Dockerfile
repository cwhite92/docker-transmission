FROM ubuntu:14.04
MAINTAINER Chris White <chris@cwhite.me>

# Update system and install dependancies
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common 

# Install transmission
RUN add-apt-repository -y ppa:transmissionbt/ppa && \
    apt-get update && \
    apt-get install -y transmission-daemon

# Add config and run script
ADD assets/transmission-daemon /etc/transmission-daemon
ADD assets/start_transmission.sh /start_transmission.sh

# Create required directories and permissions
RUN mkdir -p /transmission/incomplete /transmission/complete && \
    chmod +x /start_transmission.sh

# Create volumes for downloads
VOLUME ["/transmission/incomplete"]
VOLUME ["/transmission/complete"]

# Expose ports
EXPOSE 9091
EXPOSE 12345

CMD ["/start_transmission.sh"]
