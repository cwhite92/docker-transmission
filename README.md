# docker-transmission

Transmission daemon and web interface to download and share all your favourite Linux ISOs ;)

## Setup

**Pull the image**

    docker pull cwhite92/transmission

**Run the container**

    docker run -d --restart=always -v /path/to/persistent/config:/config -v /path/to/incomplete:/incomplete -v /path/to/complete:/complete -p 9091:9091 --name transmission cwhite92/transmission

**Change settings**

After you run the container for the first time, a `settings.json` would have been created in the persistent config directory that you specified. Edit the file to reflect the settings you'd like.

In particular, you're probably going to want to change the `rpc-whitelist` property to include your local address range:

    "rpc-whitelist": "127.0.0.1,192.168.*.*",

And your download directories to match the container volumes:

    "download-dir": "/complete",
    "incomplete-dir": "/incomplete",
    "incomplete-dir-enabled": true,

**Options**

* Change `-v /path/to/persistent/config:/config` to whatever directory you want to store your configuration in
* Change `-v /path/to/incomplete:/transmission/incomplete` to whatever directory you want to store incomplete torrents in
* Change `-v /path/to/complete:/transmission/complete` to whatever directory you want finished torrent downloads to be moved to
* Change `-p 9091:9091` to whatever port you want to use the web interface on
* Change `--name transmission` to whatever name you want to give the container
