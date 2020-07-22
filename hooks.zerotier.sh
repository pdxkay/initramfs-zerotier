#!/bin/sh

# This hook copies host zerotier into initramfs

set -e

case "${1:-}" in
  prereqs)  echo ""; exit 0;;
esac

ZT_APP=/usr/sbin/zerotier-one
ZT_CLI=/usr/sbin/zerotier-cli
ZT_ID=/usr/sbin/zerotier-idtool
ZTCFG=/var/lib/zerotier-one/

# if ZT not on machine, exit
if [ ! -f ${ZT_APP} ]; then
	exit 0
fi

[ -r /usr/share/initramfs-tools/hook-functions ] || exit 0
. /usr/share/initramfs-tools/hook-functions


copy_exec ${ZT_APP} ${ZT_APP}
copy_exec ${ZT_CLI} ${ZT_CLI}
copy_exec ${ZT_ID} ${ZT_ID}
copy_exec ${ZT_APP} ${ZT_APP}
mkdir -p ${DESTDIR}/var/lib
mkdir -p ${DESTDIR}/var/log
cp -rfpL ${ZTCFG} ${DESTDIR}/${ZTCFG}

manual_add_modules tun
