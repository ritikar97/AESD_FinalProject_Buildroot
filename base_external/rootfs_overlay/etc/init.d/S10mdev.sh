#!/bin/sh
#
# Start mdev....
#

case "$1" in
  start)
	echo "Starting mdev"
	echo /sbin/mdev >/proc/sys/kernel/hotplug
	/sbin/mdev -s
	# coldplug modules
	# find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
	    # xargs -0 modprobe -abq
	;;
  stop)
    echo "Stopping mdev"
	;;
  restart|reload)
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?
