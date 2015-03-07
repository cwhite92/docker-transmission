# docker-transmission

Transmission daemon and web interface to download and share all your favourite Linux ISOs ;)

## Setup

**Clone the repo**

    git clone https://github.com/cwhite92/docker-transmission.git
    cd docker-transmission

**Build the image**

    docker build -t cwhite92/transmission .

**Run the container**

    docker run -p 51413:51413/udp -p 9091:9091 -e USERNAME=example -e PASSWORD=changeme -v /path/to/incomplete:/transmission/incomplete:rw -v /path/to/complete:/transmission/complete:rw --name transmission -d cwhite92/transmission

**Options**

* Change `-p 51413:51413/udp` to whatever port you want to have peers connect on
* Change `-p 9091:9091` to whatever port you want to use the web interface on
* Change `-e USERNAME=example -e PASSWORD=changeme` to the username and password for the web interface
* Change `-v /path/to/incomplete:/transmission/incomplete:rw` to whatever directory you want to store incomplete torrents in
* Change `-v /path/to/complete:/transmission/complete:rw` to whatever directory you want finished torrent downloads to be moved to
* Change `--name transmission` to whatever name you want to give this container
