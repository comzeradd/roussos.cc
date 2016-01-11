title: Multi-End Message and Object Encryption. What?
date: 2016-01-05 12:41:37 
slug: jabber-omemo
tags: privacy, opensource, encryption
files: omemo.png
---

So, many people promoting Signal over Jabber/OTR for its usability and security features (besides all [caveats](https://librenet.gr/posts/497875)). Most of these features are offered due the [Axolotl Ratchet](https://github.com/trevp/axolotl/wiki) protocol.

What if this protocol was implemented as an extension to Jabber? This would combine all best things from both worlds. Offline (encrypted) messages, multiple devices, better mobile integration but on the same time decentralized federated service. Well it’s done. Meet [OMEMO](http://conversations.im/omemo/).

[Conversations](http://conversations.im/) on Android already supports it, [ChatSecure](https://chatsecure.org/blog/chatsecure-conversations-zom/) is implementing it too and tickets are already opened on [Pidgin](https://developer.pidgin.im/ticket/16801) and [Tor Messenger](https://www.mail-archive.com/tor-bugs@lists.torproject.org/msg84721.html). [Gajim](https://gajim.org/) is currently the only desktop app that supports it (through [a plugin](https://github.com/kalkin/gajim-omemo/)), but if you want to have OTR too then Gajim is not an option since [its OTR plugin is unmaintained](https://github.com/python-otr/gajim-otr).

I’ve been testing Conversations/OMEMO over the last week and it works great. So maybe in a few months we’ll have something truly secure, decentralized and usable to suggest to our friends ;) Or just suggest Conversations to the most brave of your friends.

![omemo](omemo.png)

<hr>

*Comments and reactions on [Diaspora](https://librenet.gr/posts/541037) or [Twitter](https://twitter.com/comzeradd/status/684297833453907968)*
