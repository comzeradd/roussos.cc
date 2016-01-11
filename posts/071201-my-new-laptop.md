title: my new laptop
date: 2007-12-01 00:04:54
slug: my-new-laptop
type: post
tags: opensource, gentoo
files: ibook1.jpg, ibook2.jpg, ibook3.png
---

i wanted a small (12'' at most) and lightweight laptop. my old one (an hp) had some issues with its monitor so i decided to use it as a desktop pc with external tft, keyboard and mouse. besides that it weights 3.70kgs!

i didn't want to spent much money so i searched around ebay for a nice offer. i found some vaios and a cool toshiba tablet, but after some unsuccessful bids i decided to search for a mac! so now i have a ibook g4 :) it arrived just yesterday after paying 70€ to greek customs (aggrrr).

processor: powerpc
ram: 768MB
hard drive: 30GB
screen size: 11.8''
wireless net: broadcom 4320

![ibook](ibook1.jpg)

i only saw mac os once and for 10'' since i already started installing linux. gentoo of course :) so here are the short steps:

![ibook](ibook2.jpg)

1. boot with the gentoo install cd for ppc

2. re-partition the disk with mac-fdisk

    /dev/hda1: Apple_partition_map
    /dev/hda2: Apple_bootstrap
    /dev/hda3: swap
    /dev/hda4: root filesystem

3. create the filesystems

    mkfs.ext3 /dev/hda4
    mkswap /dev/hda3
    swapon /dev/hda3

    mount /dev/hda4 /mnt/gentoo

4. download and install stage3 and portage 5. set the compile options at make.conf

    CHOST="powerpc-unknown-linux-gnu"
    CFLAGS="-O2 -mcpu=7450 -mtune=G4 -maltivec -mabi=altivec \
      -fno-strict-aliasing -pipe -mpowerpc-gfxopt -fomit-frame-pointer"
    CXXFLAGS="${CFLAGS} -fpermissive"

6. mount proc and dev and chroot

    mount -t proc none /mnt/gentoo/proc
    mount -o bind /dev /mnt/gentoo/dev
    chroot /mnt/gentoo /bin/bash
    env-update
    source /etc/profile

7. update portage

    emerge --sync

8. download and compile kernel (gentoo-sources) 9. configure fstab

    /dev/hda4     /        ext3     noatime     0 1
    /dev/hda3     none     swap     sw          0 0

10. install the bootlader yaboot

    exit
    mount -o bind /dev /mnt/gentoo/dev
    mount -o bind /sys /mnt/gentoo/sys
    chroot /mnt/gentoo /bin/bash
    /usr/sbin/env-update && source /etc/profile

    emerge yaboot
    exit

    yabootconfig --chroot /mnt/gentoo

11. reboot

    exit
    umount /mnt/gentoo/proc /mnt/gentoo/dev /mnt/gentoo/sys /mnt/gentoo
    reboot

wireless worked with the bcm43xx module and soundcard with snd_powermac. i still have to fix: suspend and 3button mouse emulation, but i guess they won't take me long :)

![ibook](ibook3.png)
