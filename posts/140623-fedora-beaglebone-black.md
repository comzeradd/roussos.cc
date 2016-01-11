title: Setup a home server with Fedora and BeagleBone Black
date: 2014-06-23 13:13:52 
type: post
slug: fedora-beaglebone-black
tags: opensource, fedora, privacy
files: beagle-fedora.png
---

Over the last [Free Software Meetup](http://www.roussos.cc/2014/04/30/athens-free-software-monthly-meetups/) we discussed about the "build your own home server" movement. This is a long and complex discussion, so most likely it will expand to future meetups. In the meantime I wanted to test BeagleBone Black (BB), as the hardware platform for such a project.

<img src="beagle-fedora.png" alt="fedora on beaglebone black" class="txt" /> I prefer BB over Raspeberry Pi (RaPi) because, despite what many people seem to believe, RaPi [is not](http://en.wikipedia.org/wiki/Raspberry_Pi#Driver_API) fully Open Hardware. I also prefer armv7 hardware, since it gives me the option to use a "regular" linux distribution. I have the option for Fedora or Debian instead of Pidora or Raspbian. 

During the meetup we talked a lot about [Arkos](https://arkos.io/), which supports many arm boards and seems like a great choice for administering your home server through a well designed web interface, lowering the technical knowledge threshold for setting up services like file or mail server. I'll get back to Arkos, but at this point I wanted to experiment with a "regular" distribution. So this post is about Fedora and Beaglebone Black.

Download the [Fedora ARM image](http://fedoraproject.org/en/get-fedora#arm) extract it and rename it to `fedora-arm.raw` so it's easier to follow the steps bellow.

Flashing Fedora to BB is not that difficult. The tricky part is that Fedora comes with an "initial setup" screen, which requires an hdmi monitor and a keyboard at least on first run so you can set some basic things (like root password). I wanted to do some modifications to the Fedora image, and get through this "initial setup" screen prior to flashing it on the BB. Inspired by [Ebal's post](http://ebalaskas.gr/blog/2013/03/25/raspberry-pi-with-archlinux-under-qemu/), I thought Qemu as a perfect tool for this job.

    sudo yum install qemu-system-arm

With qemu-system-arm tool I can emulate arm and run the image on my laptop. In order to boot the image qemu needs a kernel and what better place of finding a kernel than the image itself. You can either mount the image and copy kernel and initrd out or use libguestfs (kernel and Initrd version will obviously vary on future releases).

    sudo yum install -y libguestfs-tools
    virt-copy-out -a fedora-arm.raw /boot/vmlinuz-3.11.10-301.fc20.armv7hl .
    virt-copy-out -a fedora-arm.raw /boot/initramfs-3.11.10-301.fc20.armv7hl.img .

Finally run it. (you may have to add your user to kvm group)

    sudo usermod -aG kvm username
    newgrp kvm
    qemu-system-arm -machine vexpress-a9 -m 1024 -nographic -net nic -net user \
     -append "console=ttyAMA0,115200n8 rw root=/dev/mmcblk0p3 rootwait physmap.enabled=0" \
     -kernel vmlinuz-3.11.10-301.fc20.armv7hl \
     -initrd initramfs-3.11.10-301.fc20.armv7hl.img \
     -sd fedora-arm.raw

Booting up I reached to the "initial setup" screen I mentioned before. I created a new user with administrator (aka sudo) privileges. First things I did when finally got a prompt was to disable root account:

    sudo passwd -l root

set a hostname

    vi /etc/sysconfig/network

disable Network Manger

    systemctl disable NetworkManager.service

setup static networking

    echo "
     HWADDR="D8:D3:85:AE:DD:4C"
     BOOTPROTO="static"
     DEVICE="eth0"
     ONBOOT="yes"
     IPADDR=192.168.1.2
     NETMASK=255.255.255.0
     BROADCAST=192.168.1.255
     NETWORK=192.168.1.0
     GATEWAY=192.168.1.1
    ">/etc/sysconfig/network-scripts

add DNS settings

    echo "
     nameserver 208.67.222.222
     nameserver 208.67.222.222
    ">/etc/resolv.conf

disable selinux ([sorry Dan](http://stopdisablingselinux.com/))

    setenforce 0
    sed -i s/=enforcing/=disabled/ /etc/selinux/config

Enable ssh

    systemctl enable sshd
    firewall-cmd --permanent --zone=public --add-service=ssh

Fedora image is around 2G. I had a 4G SDcard so I expanded it by 2G

    qemu-img resize fedora-arm.raw +2G

Important to remember that this will expand the image but not the root filesystem inside. Flash it to an SDcard

    dd if=fedora-arm.raw of=/dev/sdX

This a destructive command so make sure that sdX refers to your SDcard and not some disk. Now mount the card and resize the root filesystem, that probably would be on sdX3

    e2fsck -f /dev/sdX3
    resize2fs /dev/sdX3

And that's all. I removed the mini sd from the adapter and inserted it on BB. All that's left is ethernet connection and power. Less than a minute later I was able to ssh to my soon-to-be home server from my laptop.

