#!/bin/sh

case "$1" in
    start)
        echo "Starting bme280 driver"
        modprobe i2c-dev
        /usr/bin/bme280_load  
        ;;
    stop)
        echo "Unloading bme280 driver"
        /usr/bin/bme280_unload 
        rmmod i2c-dev
        ;;
    *)
        echo "Usage: $0 {start|stop}"
    exit 1
esac

exit 0