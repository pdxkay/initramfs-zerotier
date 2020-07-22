# initramfs-zerotier
Scripts to load zerotier on your initramfs for Debian linux.

I created this for my own purposes and to solve a specific problem: I use root encryption for my home lab. I use dropbear ssh in initramfs to remotely unlock my machines. If a machine goes offline while I am out of the house, I want to be able to unlock it so it can finish booting after a restart or something. This allows me to ssh into any machine regardless where I am or what networks I'm on.

If you would like to reproduce my results, these scripts may help you.

# How to unlock a machine by ssh to it's zerotier ip address:
* Install dropbear ssh and configure initramfs function
* Install zerotier to your machine, configure it as you'd like and join networks or what have you (these scripts simply copy the running execs and configuration. You may clone your configuration and change the scripts to copy from your alternate configuration if you wish. I may do this in the future to join a separate staging zerotier network.)
* Download or clone this repo
* # install.sh (or copy the scripts yourself...)

# How this works:
Rather simple, dropbear configuration means you will have networking on your initramfs. We go a step further and load the tun module and zerotier files into initramfs. When booting, zerotier will run before dropbear, setting up a local loopback device (required for zerotier) and create the tunnel device. Zerotier will run then dropbear will run and presto, you are now connected to the zerotier network.

# OS Support:
I have tested this on Debian 10. I do not know how other distrobutions do their initramfs configuration. Either way, feel free to submit improvments or fork for your distro
