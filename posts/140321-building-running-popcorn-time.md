title: Βuilding and running Popcorn Time from source
date: 2014-03-21 17:37:19
type: post
slug: building-running-popcorn-time
tags: opensource
files: popcornshot.jpg, popcorndesktop.jpg
---

If you are not living in a cave then you probably already know everything about [Popcorn Time](http://en.wikipedia.org/wiki/Popcorn_time), so I'll skip any intro. This is a quick guide for building Popcorn Time from source code. Either because you don't want to wait for a new "official" build to get a feature (in my case [Greek subtitles](https://github.com/popcorn-official/popcorn-app/pull/211)), or because you just don't trust their binary builds.

These steps are working perfectly on my system (Fedora), but with small modifications these should also work on any Linux box.

###Install system dependencies

`sudo yum install nodejs rubygem-compass wget git`

###Get the source code

Clone from the [repository](https://github.com/popcorn-official/popcorn-app/):

`git clone https://github.com/popcorn-official/popcorn-app.git`

or if you have a github account you can fork it, if there is any chance you might contribute back to the project.

###Install project dependencies

Popcorn Time is written in javascript so we'll need grunt and the rest of the project dependencies.
We change into the project directory, that we just pulled with git, so all of these get installed locally under node_modules.

    cd popcorn-app
    npm install grunt-cli bower
    npm install

###Build

`node_modules/grunt-cli/bin/grunt build --platforms=linux64`

If everything works you should get a "Done, without errors." message at the end.

###Install

Now let's move the build to a place where we can launch it easily

    sudo cp build/releases/Popcorn-Time/linux64/Popcorn-Time/ /opt/
    sudo ln -s /opt/Popcorn-Time/Popcorn-Time /usr/bin/

and create a Desktop entry

    sudo wget https://avatars0.githubusercontent.com/u/6956202?s=140 -O /usr/share/pixmaps/popcorntime.png
    sudo echo "[Desktop Entry]
        Name=Popcorn Time
        Comment=Watch movies in streaming with P2P.
        Exec=/usr/bin/Popcorn-Time
        Categories=AudioVideo;
        StartupNotify=false
        Type=Application
        Icon=popcorntime" > /usr/share/applications/popcorn-time.desktop

Popcorn Time now is available as a Desktop shortcut.

![popcorn time desktop icon](popcorndesktop.jpg)

All you have to do is prepare some popcorn :)

![popcorn time screenshot](popcornshot.jpg)

