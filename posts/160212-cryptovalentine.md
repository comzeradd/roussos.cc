title: Will you be my cryptovalentine?
date: 2016-02-12 15:01:23
slug: cryptovalentine
tags: privacy, encryption, opensource
files: cryptolove.jpg
---

![cryptovalentine](cryptolove.jpg)

> Roses are red, violets are blue; I use free software to encrypt my online communication and so should you.

Over the last few year Free Software Foundation Europe runs a campaign called ["I love Free Software Day"](https://fsfe.org/campaigns/ilovefs/2016/). It's an opportunity to share your appreciation (or love) with the developers of your favorite Free Software project. So after you are done reading this post, **choose your favorite project and send its developer(s) an appreciation email**.

Last year [Zak Rogoff ](http://zakkkko.com/), had a great similar idea. On [a post he wrote](https://www.fsf.org/blogs/community/will-you-be-my-cryptovalentine) he suggested we use the Valentine's Day as an opportunity to use Free Software in order to setup secure and private communications with our significant other.

> Ask someone you like -- romantically or otherwise -- to be your cryptovalentine. If they say yes (yikes, nervous!) use the free program GnuPG to set up private and encrypted communication with them.

Last year this was like a late new year's resolution for me. I didn't want to stick to GnuPG or just set the tools up. I wanted to make sure that all forms of communication are secure and private. This is how I (partially) did it. This is focused on mobile communications, because that is what we almost exclusively use for communicating when online.

#### **Email**

The first thing that comes to mind is email and the obvious choice of GnuPG. And specifically [OpenKeyChain](https://www.openkeychain.org/about/) and K9. And it's of course the first thing I did. If you are thinking "GPG keys on mobile? Are you sure?", then you have a [different threat model](https://www.roussos.cc/2016/02/01/passive-surveillance/) in mind.

OpenKeyChain has made major steps over the last couple of years in terms of usability. It's easy even to generate a new key directly on your phone and easily fetch your contacts keys from keyservers or import them. It's also easy to connect it with the K9 mail client.

Despite all improvements I'm not completely satisfied with the end result at the moment. There is one thing that can really ruin everything. There is no way currently to configure K9 to encrypt all outgoing emails by default if a key is present. That can lead to accidentally replying to an encrypted email in plain text, or just forget to tick the encryption mode when composing a new email. Good thing is that K9 doesn't quote an encrypted email as unencrypted text when replying, which makes emails look ugly but at least it saves you from leaking data by mistake. There is also the issue of PGP/Mime support, but that' not relevant to the communication model I'm describing here. Both ends will use PGP inline, so you'll be ok.


#### **Chat**

The obvious decentralized choice would be Jabber with OTR. Many things have changed over the last couple of years. Apps like WhatsApp or Telegram have become really popular. Both of course are not to be considered secure. Source code is not completely open and free and both are centralized which gives one entity the knowledge of the entire social graph. But these apps created a usability precedence. People expect easy registration, even if that requires giving away their phone number and, even worse, their entire addressbook. And people also expect that this will work flawlessly on mobile, where connection can sometimes be flaky. Jabber with OTR fails on both. For the communication model I'm describing here registration issues are not important. But being able to communicate over mobile networks is really important.

Surprisingly many people on the free and open source camp started using (and promoting) Signal, which is indeed better that the two previous options of WhatsApp and Telegram, since the whole stack is completely free and open source. But it keeps all the other problems mentioned above (centralized, addressbook access, etc). I have [written about this](https://www.roussos.cc/2015/12/05/signal-privacy/) in details before and [Signal's attitude](https://twitter.com/moxie/status/644551336843870208) shows that things can only get worse.

So where does this leave us? Signal's protocol, [Axolotl Ratchet](https://github.com/trevp/axolotl/wiki), is really well designed. What if this could work on top of Jabber? Then we would have the best things of both worlds. That's what [OMEMO does](https://www.roussos.cc/2016/01/05/jabber-omemo/).

So my choice was the [Conversations](https://conversations.im/) app using Jabber along with OMEMO encryption. I have to admit this turn out to work far better than I expected. **You set the encryption once and then you forget about it. It just works.** All communications are encrypted by default. Offline messages just work. You don't have to worry if the other end is online at the moment. No need to terminate or re-establish encryption sessions (sounds familiar OTR friends?). This worked so good that we actually replaced email communications. I mean, think about it. Most of the emails we exchange during the day are short texts. The only reason we were using email was because it gives the feeling of asynchronous non-urgent communication. But if you have a chat application that online presence doesn't really matters then you already have this.

#### **SMS**

We rarely use the mobile telephony network to chat, and since we started using Jabber/OMEMO, this became even more rare. But just for these rare cases, here is what I did and suggest.

Signal started as TextSecure and it used to support the SMS network too. At some point they decided to drop SMS support for [various reasons](https://whispersystems.org/blog/the-new-textsecure/). Then a free software team forked it and kept just the SMS part (it's Axolotl Ratchet again) and dropped all Google dependencies to create [SMSSecure](http://smssecure.org/). Similar to what I mentioned above, you setup the encryption once and then you forget it. I set this up months ago and all SMS we have exchanged since are encrypted. The app of course works as a regular SMS app, so you just make it your default one and use it for regular plain text SMS messages for the rest of your not-so-brave contacts. At least you'll have encrypted local storage for your sms messages, something that most sms apps don't offer.

#### **Voice**

This is the most difficult one, and the one we haven't yet completely achieve. It's not easy to encrypt phone calls and still keep using the traditional mobile network of your carrier. So the next best thing is to do it over the data network. Again usability is important here. So SIP was not my first option. Many apps have come into life over the last couple of years, but most of them are still not mature enough. For instance [Tox](https://tox.chat/) is nice, but the mobile client lacks voice calls at the moment and their core protocol is not designed with mobile usage in mind, which leads to battery drainage.

Another similar approach is the [Ring](https://ring.cx/). It's also at its early days, but recently the mobile client added voice calls. We started using it over the last month, but it's still early to judge it. If you are interested in the technical details see the [core developers presentation](http://ftp.fau.de/fosdem/2016/k1105/building-a-peer-to-peer-network-for-real-time-communication.mp4) at this year's Fosdem.


#### **Video**

Weirdly enough this is something we solved long before the voice communications. Video is something you explicitly choose to do, so you don't have so many requirements in terms of integration with the rest of the phone operating system. We use [WebRTC](https://en.wikipedia.org/wiki/WebRTC). Encryption is mandatory for WebRTC, using [DTLS](https://en.wikipedia.org/wiki/Datagram_Transport_Layer_Security) and it's P2P. You can find many services out there, some completely Free and Open Source (so you can set it up on your own if you don't trust them), and a few also offer private rooms.

Another option (still WebRTC) is [Firefox Hello](https://www.mozilla.org/en-US/firefox/hello/). I've been using Hello from the first day it was released and works great. The only problem is that you can initiate a call only from a Desktop Firefox. But a few months back Hello offered the option to create a room, give it an alias to make it more recognizable than a hash and bookmark it. So if both ends have this unique url they can initiate a video call directly from Firefox mobile.

Whatever WebRTC option you choose remember that this works through your browser. I have test this only on Firefox, but it should work on other browsers too with no extra plugin. Just use a browser that it's Free and Open Source. Otherwise [you shouldn't trust it](https://twitter.com/comzeradd/status/653535902950682624) for your communications.

#### **Now it's your turn**

All apps mentioned here are available on [F-droid](https://f-droid.org/), so it's not that hard to get started. Remember, [our privacy is interdependent](https://www.roussos.cc/2014/05/14/our-privacy-is-interdependent/). It's not enough to secure your devices only. What better way to start than this? Ask your significant other or someone you like, romantically or otherwise, to be your cryptovalentine. You don't have to use the specific tools I mention here. I urge you to use only Free / Open Source software and decentralized services. And remember this is just the beginning. After you succeed, spread this know-how to the rest of your friends.

<hr>

*Comments and reactions on [Diaspora](https://librenet.gr/posts/601875) or [Twitter](https://twitter.com/comzeradd/status/698135511437803520)*
