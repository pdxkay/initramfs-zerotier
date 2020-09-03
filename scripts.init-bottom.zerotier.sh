#!/bin/sh

PREREQ=""

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

EXE="$(readlink -f /sbin/dropbear)" && [ -f "$EXE" ] || exit 1


ZT_APP=/usr/sbin/zerotier-one

# if ZT not on machine, exit
if [ ! -f ${ZT_APP} ]; then
	exit 0
fi

log_begin_msg "Stopping ZeroTier"
kill -TERM $(cat /run/zerotier-one.pid)
sleep 1
log_end_msg

log_begin_msg "Removing loopback device"
# shutdown lo
ifconfig lo down
log_end_msg

log_begin_msg "Removing tun device"
# remove created tun device
rm /dev/net/tun
log_end_msg