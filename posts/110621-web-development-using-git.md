title: web development using git
date: 2011-06-21 11:03:17
slug: web-development-using-git
type: post
tags: opensource, webdev
status: draft
---

I think that the title says everything. This post describes how I'm using git for version controlling my web apps.

The scheme I use is very simple. There is the live web root, that serves the app to the public, and the local copy where the actual development takes place.

Those of you familiar with git may find the above setup a little bit strange. Git is a  decentralized version control system and it seems that I'm trying to centralize it. But hey, this what I wanted to do and this is why I'm writing this post.

**Initial Setup**

The key here is that we need a bare repository on our server in order to push the updates. A bare repository does not contain a working copy of our files, but the git index, objects reflecting updates to that index. That is why we can't actually work there, and it simply serves as a collection point for all the developers working on the project that it contains.

So lets go where we have our web app on the server (in my case this usually is a django project). We initialize a git repository:

    cd /var/www/myproject
    git init git add .
    git commit -am "Initial commit"

So we made a git repository out of my project webroot. I'm guessing you already know how to use .gitignore (for instance I want to exclude django's settings.py, because I want different settings on my local copy) and git config, to set you name, etc.

Now let's clone it to a bare repository:

    cd ..
    git clone --bare myproject myproject.git

It's a good convention to create the bare repository with .git extension, if you want to serve your code through gitweb.

**Local Repo**

Now let's setup our local repository:

    cd /home/me/dev/
    git clone ssh://mydomain.net/var/www/myproject.git

Now we have a complete local copy of the server version of our website.

**Live Web Root**

Remember the key repository on the server is the myproject.git, not the myproject. So we need to swap them out.

    mv myproject tmpbackup
    git clone myproject.git

This puts a clone of our myproject.git directory in the current directory, which will be named myproject.

So let's sum up. As I said in the beggining all the development process is taking place on my local repo. If this project has more than one collaboratos, each one must clone locally the myproject.git repository as we did earlier.

The live webroot is permantly checked out on the master branch. Locally I use as many branches as my development proccess requires and I'm merging to the master all the code changes I believe are stable to go live.

**Auto-Update**

So what happens when I push? First of all I don't just push the master branch, because I want to have a copy of my code on the server. Remember: when I push it's the myproject.git that gets synced. I wanted my live webroot to sync automatically when I push a change. So we create a post-update script that will do the trick:

    cd /var/www/myproject.git/hooks
    touch post-update
    chmod +x post-update

And edit post-update with:

    #!/bin/bash
    #
    WEB_DIR="/var/www/myproject"
    export GIT_DIR="$WEB_DIR/.git"
    pushd $WEB_DIR > /dev/null
    git pull popd > /dev/null

**Every Day Developing**

Now I keep developing on my local repository, and pushing the changes.

     git commit -a -m "Another update"; git push

If a change is merged on the master branch, the live web root would be automatically updated (thanx to the post-update script above).

