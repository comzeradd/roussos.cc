title: Filesystem activity
date: 2006-12-14 23:21:11
type: post
slug: filesystem-activity
tags: opensource, sysadm
---

so... you 're sitting in front of your pc, but you are not really doing something. in fact you are doing absolutely nothing.

despite that you can hear from time to time the hard disk spinning up just for a very short period of time.

don't you have the slightly curiosity to find out why? which process access your hard disk in the background?

i had that curiosity so here is what i did (i think that it requires kernel>2.6.1):

    cat /proc/sys/vm/block_dump

i got 0. this is a feature that helps you monitor filesystem activity. so i activated it:

    echo 1 > /proc/sys/vm/block_dump

i set the value to 1, so as i can watch which process is making use of the disk. now it should start logging the activity into your syslog files:

    tail -f /var/log/debug

there are two main types of entries that block_flush generates: dirty inodes and block read/writes. dirty inode entries just mean that something altered the inode for that file, most commonly it's due to an update to that files atime (access) or mtime (modification). if you look at the beginning of the output above, you'll see a lot of dirtied library inodes. these are the libraries linked against the tail command that was just executed, so their atime was just updated. the remainder, block reads and writes, are just normal reads and writes to the hard disk.

of course this procedure generates a lot of filesystem activity, so remember to deactivate it afterwards:

    echo 0 > /proc/sys/vm/block_dump
