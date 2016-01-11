title: speed up firefox (reloaded)
date: 2010-06-23 14:30:06
slug: speed-up-firefox-reloaded
status: publish
post_type: post
tags: opensource, mozilla, hack
---

I've posted before about[ this little hack on speeding up firefox](/2009/04/23/speed-firefox/). The key is that you actually **move the entire .mozilla folder from disk to memory**. First you have to mount /tmp to memory (some linux distributions may do this by default) adding this line to /etc/fstab and rebooting:

`none /tmp tmpfs size=512M,nr_inodes=200k,mode=01777 0 0`

Then it's safe to do:

    cp -R /home/user/.mozilla /home/user/.mozilla_save
    mv /home/user/.mozilla /tmp/mozilla
    ln -s /tmp/mozilla /home/user/.mozilla

I updated the script so I can use it as a system init script:
    
    
    #!/bin/bash
    
    start() {
        mkdir -p /tmp/mozilla
        rsync -avi --delete /home/user/.mozilla_save/ /home/user/.mozilla/
    }
    
    stop() {
        size=`du -xs /home/user/.mozilla/ | awk '{print $1}'`
        digits=`expr length $size`
        if [ $digits -gt 4 ]; then
            rsync -avi --delete /home/user/.mozilla/ /home/user/.mozilla_save/
        else
            echo 'no!'
            exit 0
        fi
    }
    
    case "$1" in
    start)
         start
         ;;
    stop)
         stop
         ;;
    *)
         echo $"Usage: $0 {start|stop}"
         exit 1;;
    esac
    

So I placed this script at /etc/init.d/, made it executable and created a link inside /etc/rc.5/

`ln -s /etc/init.d/ffsync.sh /etc/rc5.d/S99ffsync`

rc5 because the default runlevel on Fedora is 5. You can see yours from /etc/inittab. So every time my system boots the above script runs with the start option (executing the start function) and every time it halts/reboots it runs with the stop option (stop function). In order to be sure that no data loss will occur in the unlikely event of sudden shutdown, I have a cronjob that saves the mozilla folder every 15 minutes.

`*/15 * * * * /etc/init.d/ffsync.sh stop`

Trust me. With the above hack you'll see **a significant difference on firefox's speed**. Especially if you're you using [firefox's awesome address bar](http://blog.mozilla.com/blog/2008/04/21/a-little-something-awesome-about-firefox-3/) to search through your browser's history.

