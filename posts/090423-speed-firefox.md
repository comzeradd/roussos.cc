title: speed up firefox
date: 2009-04-23 11:48:38
slug: speed-firefox
type: post
tags: opensource, mozilla, hack
---

firefox 3 features [an awesome address](http://support.mozilla.com/en-US/kb/Smart+Location+Bar) bar that helps you search through your history (and bookmarks) by just typing a word or phrase that's part of either the url or the title. the problem is that if you keep the browsing history for a long time (lime me) the address bar search process becomes very slow. a cool solution is to place the ~/.mozilla folder on ram (which is a lot faster than disk). i already have /tmp on ram, so i made a symbolic link ~/.mozilla pointing to /tmp/mozilla. and then i use the script below in order to save/restore the contents of mozilla folder: 
    
    #!/bin/bash
    
    if [ $# -lt 1 ]; then
        echo "usage: ff_sync.sh save/restore"
        exit 0
    fi
    
    action=$1
    
    if [ "$action" = "save" ]; then
        size=`du -xs /home/user/.mozilla/ | awk '{print $1}'`
        digits=`expr length $size`
        if [ $digits -gt 4 ]; then
            rsync -avi --delete /home/user/.mozilla/ /home/user/.mozilla_save/
        else
            echo 'no!'
            exit 0
        fi
    fi
    
    if [ "$action" = "restore" ]; then
        mkdir -p /tmp/mozilla\
        rsync -avi --delete /home/user/.mozilla_save/ /home/user/.mozilla/
    fi

all i have to do is run this script with the appropriate option when booting/halting the pc. on gentoo you have /etc/conf.d/local.start and /etc/conf.d/local.stop for this kind of things. and i have to say that i'm really impressed. firefox speed  improved amazingly. and i mean firefox overall speed, not just the address bar ;)
