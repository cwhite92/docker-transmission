#!/bin/bash

set -e

CONFIG_DIR=/etc/transmission-daemon
SETTINGS=$CONFIG_DIR/settings.json
TRANSMISSION=/usr/bin/transmission-daemon

if [[ ! -f ${SETTINGS}.bak ]]; then
    if [ -z $USERNAME ]; then
        echo Provide a username for the Transmission web interface via the USERNAME environment variable.
    fi

    if [ -z $PASSWORD ]; then
        echo Provide a password for the Transmission web interface via the PASSWORD environment variable.
        exit 1
    fi

    sed -i.bak -e "s/@username@/$USERNAME/" $SETTINGS
    sed -i.bak -e "s/@password@/$PASSWORD/" $SETTINGS
fi

exec $TRANSMISSION -f --no-portmap --config-dir $CONFIG_DIR --log-info
