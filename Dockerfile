FROM debian:jessie
MAINTAINER Chris White <chris@cwhite.me>

# Install transmission
RUN apt-get update && \
    apt-get install -y transmission-daemon

# Create volumes for config and downloads
VOLUME ["/config", "/incomplete", "/complete"]

# Expose ports
EXPOSE 9091

CMD ["/usr/bin/transmission-daemon", "-f", "--no-portmap", "--config-dir", "/config", "--log-info"]
