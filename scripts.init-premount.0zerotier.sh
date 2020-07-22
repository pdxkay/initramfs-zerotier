#!/bin/sh

PREREQ="udev"

prereqs() {
    echo "$PREREQ"
}

case "$1" in
    prereqs)
        prereqs
        exit 0
    ;;
esac

. /scripts/functions

ZT_APP=/usr/sbin/zerotier-one

# if ZT not on machine, exit
if [ ! -f ${ZT_APP} ]; then
	exit 0
fi

# start zerotier if it exists
[ "$BOOT" != nfs ] || configure_networking

# create tun device file
mkdir /dev/net
mknod /dev/net/tun c 10 200

# set up local loopback
/sbin/ifconfig lo 127.0.0.1

# run zerotier-one
${ZT_APP} &> /var/log/zerotier.log &

echo $! >/run/zerotier-one.pid
