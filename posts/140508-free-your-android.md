title: Free Your Android
date: 2014-05-08 11:22:03 
type: post
slug: free-your-android
tags: opensource, android, fsfe, privacy
files: apg.png, chatsecure.png, cyanogenmod.png, davdroid.png, diaspora.png, documentviewer.png, epub3.png, erader.png, fbreader.png, fdroid.png, firefox.png, fya.png, gpslogger.png, guardian.png, k9.png, keychain.png, lumicall.png, orweb.png, osmand.png, osmtracker.png, ostel.png, owncloud.png, seafile.png, ttrssreader.png, twidere.png, wallabag.png, xabber.png
---

After all the recent NSA revelations, it's been even more important to use Free Software on our mobile phones. Let me express this in another way: **We should be very careful about what software we use on a device that is always on and in our pocket 24h a day.**

Starting from the very basic thing that makes our smartphone operate, it seems that we don't have many options. So if you are using Iphone or Windows Phone, let me remind you that both of these companies are in the [infamous NSA slides](https://en.wikipedia.org/wiki/PRISM_%28surveillance_program%29#The_slides) for giving access to users private data.

So this post is about Android and my current setup of running only Free Software on my smartphone. I know what you are thinking.. that Google is also part of NSA's "special friends". Android is self-defined as an "Open Source Platform" (AOSP), and pretty much it is since it's released under a mix of Apache and GPL license (although mostly developed behind closed doors). But this isn't what you get when you buy a smartphone. Your device will certainly have preinstalled all of the Google's proprietary stuff (gmail, play, etc) and probably manufacturer and/or vendor applications. Things that you have no idea what they do, besides their "normal" functionality, because we don't have the code to look at.

### Operating System
<img src="cyanogenmod.png" alt="" class="txt" /> If you happen to be on [Replicant's short list](http://redmine.replicant.us/projects/replicant/wiki/ReplicantStatus) of supported devices then this is the way to go. But since this applies to very few people [CyanogenMod](http://www.cyanogenmod.org/) is the next best thing.

That's the part that is most difficult, since you have to flash your phone with the right CyanogenMod's ROM. The [instructions on the wiki](http://wiki.cyanogenmod.org/w/Devices) are very detailed, but I know that this should look like a difficult process to non-geeks. At FSFE we run a campaign on how to [free you Android](https://fsfe.org/campaigns/android/liberate.en.html), so if you ever happen to find out about a "Free your Android" workshop near you location go and people will love to help you.

Still, if flashing your phone seems too complex skip to the next section, but at least stop using the pre-installed proprietary apps and remove any Google account you may have entered during initial phone setup (a factory reset may help).

CyanogenMod is not perfect. It contains [scripts that extract](https://github.com/CyanogenMod/android_device_semc_iyokan/blob/gingerbread/extract-files.sh) proprietary code necessary for some phone components (eg. camera) to work. The good thing is that these parts are firmware, thus non-executable code. You may also need to tweak it a bit:

- Remove Google analytics from CyanogenMod by flashing [freecygn](https://github.com/mar-v-in/freecyngn).
- Stop CyanogenMod from reporting tethering usage to your provider, by [changing the "tether dun required" setting](https://pmf.silvrback.com/fixing-tethering-on-android-kitkat).
- [Change DNS settings](http://blog.varunkumar.me/2010/09/how-to-change-dns-server-on-android.html) so that CyanogenMod stops using Google's DNS servers, that has a permanent log policy.
- Choose to fully encrypt your device with a pin (Settings -> Security -> Encrypt phone).

### Apps

<img src="fdroid.png" alt="" class="txt" width="130" /> Since we got rid Google apps, one way or another, we need a way to install software to our phone. Free Software. [F-droid](https://f-droid.org/) comes to the rescue, an app for accessing software repositories for android and that comes preconfigured with its own repository containing only Free Software apps. Install it and then head over to [Guardian project](https://guardianproject.info/2012/03/15/our-new-f-droid-app-repository/) to add its repository to F-droid. I won't provide links for the apps below, since you can easily install them through F-droid.
<br><br>

#### Contacts / Calendar

*DavDroid* is an app for synchronizing Contacts and Calendar. It supports both CalDAV and CardDAV, so you will be able to set it with your provider or self hosted service.

<img src="davdroid.png" alt="" class="txt" width="32" /><br><br>

#### Email

*K9* is the ultimate email client for Android. It has all the features you would expect from a mail client. You can combine it with *AGP* or *OpenKeychain* for PGP (I prefer the second, since AGP doesn't support subkeys yet).

<img src="k9.png" alt="" class="txt" width="32" /> <img src="apg.png" alt="" class="txt" width="32" /> <img src="keychain.png" alt="" class="txt" width="32" /><br><br>

#### Browser

Well... *Firefox*. You can add some of the usual privacy Add-ons. *Orweb* is a browser preconfigured for anonymous access to the web through the Tor network.

<img src="firefox.png" alt="" class="txt" width="32" /> <img src="orweb.png" alt="" class="txt" width="32" /><br><br>

#### Files / Photos

I have an [Owncloud](http://owncloud.org/) instance and although I use it mostly for Contacts/Calendar (I prefer [Sparkleshare](http://sparkleshare.org/) for files) I find it really handy that my photos can be synced automatically with OwnCloud and accessed directly from my laptop. [Seafile](http://seafile.com/) also seems like a great choice, but haven't tested it yet.

<img src="owncloud.png" alt="" class="txt" width="32" /> <img src="seafile.png" alt="" class="txt" width="32" /><br><br>

#### Maps

*OsmAnd* is the best maps android application (yes better than Google maps), mostly due to its great offline feature. Map data come straight from the work of [OpenStreetMap](http://www.openstreetmap.org/) contributors. I always install *OSMTracker* to my phone to be able to contribute myself and GPSLogger to log [my bike rides](http://ridewithgps.com/users/80721).

<img src="osmand.png" alt="" class="txt" width="32" /> <img src="osmtracker.png" alt="" class="txt" width="32" /> <img src="gpslogger.png" alt="" class="txt" width="32" /><br><br>

#### News

*TTRSS-Reader* is the android version of the well known Free Software RSS reader [TinyTinyRSS](http://tt-rss.org/). It will play along with both self hosted and 3rd party instances. *Poche* helps saving articles to "Read them later" on a [Wallabag](https://www.wallabag.org/) instance.

<img src="ttrssreader.png" alt="" class="txt" width="32" /> <img src="wallabag.png" alt="" class="txt" width="32" /><br><br>

#### Chat

XMPP (Jabber) is the obvious choice for instance messaging. *ChatSecure* and *Xabber* are the best android apps for that job. Both support OTR for encrypted communication, but ChatSecure is better on this field since it can be combined with [KeySync](https://guardianproject.info/apps/keysync/) and sync your OTR keys with the ones you keep on your desktop client.

<img src="chatsecure.png" alt="" class="txt" width="32" /> <img src="xabber.png" alt="" class="txt" width="32" /><br><br>

#### Documents / Ebooks

I prefer reading on my Kobo, but in case you want an epub reader *FBReader* will be a good choice. *Document Viewer* opens pdf documents (plays well with mail attachments).

<img src="fbreader.png" alt="" class="txt" width="32" /> <img src="documentviewer.png" alt="" class="txt" width="32" /><br><br>

#### Social / Microblogging

I use *Twidere* for Twitter. Great app. Supports StatusNet too. There is also a *Diaspora Webclient* app, that seems to just wrap Diaspora's mobile web interface.

<img src="twidere.png" alt="" class="txt" width="32" /> <img src="diaspora.png" alt="" class="txt" width="32" /><br><br>

#### VoIP

Guardian project has setup an SIP provider ([Ostel.co](https://ostel.co/)) that just works, encrypting calls by default (aka [ZRTP](https://en.wikipedia.org/wiki/ZRTP)). They suggest *CSipSimple* for using this android, but I've tried *Lumicall* and works great.

<img src="lumicall.png" alt="" class="txt" width="32" /> <img src="ostel.png" alt="" class="txt" width="32" /><br><br>

<img src="fya.png" alt="" width="120" /> 

All the software I mention here is stuff I use. I'm sure that in some cases you may find alternatives that better suit your needs. So dig deeper to F-droid for more apps and surf through [FSFE's website](https://fsfe.org/campaigns/android/liberate.en.html).

I currently have an android smartphone that runs 100% Free Software applications. I can't think of missing any functionality so far and I certainly feel more secure ;)
