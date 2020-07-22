#!/bin/bash

# copy script into initramfs-tools dirs
echo "Copying files"
cp hooks.zerotier.sh /usr/share/initramfs-tools/hooks/zerotier
cp scripts.init-bottom.zerotier.sh /usr/share/initramfs-tools/scripts/init-bottom/zerotier
cp scripts.init-premount.0zerotier.sh /usr/share/initramfs-tools/scripts/init-premount/0zerotier

# update initramfs to now include our scripts
echo "Updating initramfs"
update-initramfs -u
