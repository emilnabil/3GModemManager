#!/bin/bash
# setup command=wget https://raw.githubusercontent.com/emilnabil/3GModemManager/main/installer.sh -O - | /bin/sh
#################
PLUGIN_URL="https://raw.githubusercontent.com/emilnabil/3GModemManager/main"
#  Remove Old Plugin  #
echo "   >>>>   Remove old version   "
opkg remove SystemPlugins-3gmodemmanager
rm -r /usr/lib/enigma2/python/Plugins/SystemPlugins/3GModemManager


cd /tmp || { echo "Failed to access /tmp directory"; exit 1; }

echo "Downloading plugin archive..."
if wget "$PLUGIN_URL/3GModemManager.tar.gz" -O 3GModemManager.tar.gz > /dev/null 2>&1; then
    echo "Extracting plugin..."
    if tar -xzf 3GModemManager.tar.gz -C / > /dev/null 2>&1; then
        rm -f 3GModemManager.tar.gz
        echo "#########################################################"
        echo "#  3GModemManager INSTALLED SUCCESSFULLY           #"
        echo "#########################################################"
        exit 0
    else
        echo "Error: Failed to extract plugin archive."
        exit 2
    fi
else
    echo "Error: Failed to download plugin archive."
    exit 3
fi
