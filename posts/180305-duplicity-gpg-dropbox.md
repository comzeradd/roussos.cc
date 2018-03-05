title: Encrypted cloud backups with Duplicity and GPG
date: 2018-03-05 17:57:00
slug: duplicity-gpg-dropbox
tags: opensource
files: dpbx-create_app.jpg, dpbx-gen_key.jpg
---

### why

You already do regular offline backups right? If not, pause reading. Go buy an external drive, encrypt it with LUKS and backup your files. Now, welcome back.

I wanted a way to backup my (important) files on <s>the cloud</s> someone else's computer. I have two main reasons for that. First of all, I want to have a backup outside the premises of my home. Sometimes accidents happen, or someone could just break in or raid my place and take my backups. Of course these are encrypted but I'd have lost access to my files. Another reason is that I want to be able to access my files from any device (not necessarily mine) and from anywhere in the world.

In this example I'm using Dropbox as an example of cloud storage. You can replace Dropbox with almost any commercial or not cloud storage service out there, your self-hosted VPS, etc. I chose Dropbox for this example for its simplicity and popularity, but also to emphasize one more aspect. If you trust encryption, which happens at your end, then you don't need to trust the storage provider. At least not in terms of security. You would still need to trust the reliability of whatever endpoint you choose. Dropbox in that scenario is as good as your self-hosted server.

### the backup script

The basic ingredients are [Duplicity](http://duplicity.nongnu.org/) and GnuPG. I'll insert here the backup script and then I'll explain in detail how this works and what things you need to customize.

    #!/usr/bin/env bash
    set -e

    # Dropbox configuration variables
    DROPBOX_FOLDER="mybackup"
    export DPBX_ACCESS_TOKEN=""
    export PASSPHRASE=""

    # Folders to backup
    MY_PRECIOUS="/precious"
    SECRET_DATA="/data/secret"

    # Remove files older than 60 days from Dropbox
    duplicity remove-older-than 60D --force dpbx://${DROPBOX_FOLDER}
    # Sync everything to Dropbox
    duplicity --include=${MY_PRECIOUS} --include=${SECRET_DATA} --exclude='**' / dpbx://${DROPBOX_FOLDER}
    # Cleanup failures
    duplicity cleanup --force dpbx://${DROPBOX_FOLDER}

    unset DPBX_ACCESS_TOKEN
    unset PASSPHRASE

Duplicity has a very simple interface that can be summarized with this line:

    duplicity [source] [destination]

You can provide one source and one destination, but you can use the `--include` and `--exclude` options to customize things. One important thing to remember is that the more left is such an option the bigger precedence it has. Here is our main backup line:

    duplicity --include=${MY_PRECIOUS} --include=${SECRET_DATA} --exclude='**' / dpbx://${DROPBOX_FOLDER}

So reading this line from right to left can help you better understand what it actually does. We instruct Duplicity that our destination is a Dropbox folder. We want to back everything (`/`), but then we exclude everything (`'**'`) and include only the two folders we want in this case. A simpler example would be to backup our home directory and exclude specific folders. That would look like this:

    duplicity --exclude=${NOT_THIS_FOLDER} --exclude=${TMP_FOLDER} /home/myuser dpbx://${DROPBOX_FOLDER}

Anything that starts with a `$` sign is a variable, so we set everything in the beginning of the script and unset the sensitive things at the end.

Duplicity has certain name conventions for things. So `DPBX_ACCESS_TOKEN` is the Dropbox token (see below) and `PASSPHRASE` is the encryption key. It will use GPG to do the encryption and since we provide a passphrase and not a key fingerprint it will use symmetric encryption. You can of course use your PGP key if you want, but as I already mentioned I want to be able to fetch and decrypt the backup from anywhere. That means that I may not have access to my PGP key.

### Dropbox

The nice thing about this workflow is that you don't need to run any Dropbox related code to your machine. All you need is go to Dropbox developers portal and [create a new app](https://www.dropbox.com/developers/apps/create). Choose to create an "App folder" kind of app and pick a name, as shown in the screenshot below.

![dropbox create app](dpbx-create_app.jpg)

On the next screen all you need to do is generate an access token. It's the string you need to use on the `DPBX_ACCESS_TOKEN` variable of your backup script. And that's it!

![dropbox generate key](dpbx-gen_key.jpg)

### Let it run

Duplicity does incremental backups, so you can just cron the script to run daily, weekly or whatever fits your needs. For instance you can do a symbolic link to your `/etc/cron.daily` or if you prefer <s>hipster</s> modern tools you can use systemd timer.

### Restore

Let it run a few times and then try to restore your files. Backups that don't restore properly are useless. You can selectively restore specific files, but I'll let that to you as homework. To restore everything:

    #!/usr/bin/env bash
    set -e

    # Dropbox configuration variables
    RESTORE_FOLDER="mybackup"
    export DPBX_ACCESS_TOKEN=""
    export PASSPHRASE=""

    # Restore
    duplicity dpbx://${DROPBOX_FOLDER} ${RESTORE_FOLDER}

    unset DPBX_ACCESS_TOKEN
    unset PASSPHRASE


### Final bits

1. Pick a really really long passphrase.
2. Adjust your backup script permissions to make it accessible only to your eyes.

<hr>

*Comments and reactions on [Diaspora](https://librenet.gr/posts/1787179) and [Twitter](https://twitter.com/comzeradd/status/970703206165643264)*.
