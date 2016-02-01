title: Fighting Passive Surveillance should be our top priority
date: 2016-02-01 11:01:52
slug: passive-surveillance
tags: privacy, encryption, opensource
files: massive.jpg
---

![massive](massive.jpg)


#### **Post-Snowden**

We definitely live in a different world since Snowden leaks, but for some people nothing has changed. We always knew that certain individuals are targeted by local or international law enforcement agencies. In some cases they even have a legal way of doing this. If you work on certain fields or operate as an activist in political issues, you always assumed or knew that your communications are monitored. We may have better knowledge on the way the do it, or which things they have broken and which not yet. But essentially nothing is new about this on the post-Snowden world.

What Snowden leaks actually changed, what we learned from the documents, is that there is a vast ongoing process of massive passive surveillance and data collection. **It doesn't matter if you are considered important. It doesn't matter if you have something to hide or not. All of your communications are monitored, stored and analyzed.** This is what changed. This is what we learned.

Let me pause my thoughts for a moment and share a controversial story...

#### **Mobile email encryption**

Would you store your private PGP key to your mobile smartphone? Many (most?) hackers/geeks would easily answer in a negative way. Mobile phones have two major security implications that our laptops (usually) don't.

* Physical security. It's more easy to lose your phone, or for someone to steal it. It's a comparatively smaller device, usually carried away in your pocket. And once you lose it, all keys stored there should be considered compromised (which is a big problem on its own, since PGP doesn't offer [Forward Secrecy](https://en.wikipedia.org/wiki/Forward_secrecy)).

* More than one operating system. Even if you have taken [all measures](https://www.roussos.cc/2014/05/08/free-your-android/) to secure your operating system, the problem is that your phone runs also a second operating system. The "radio" OS running on your baseband chip. It's a complete proprietary black box, that you don't know what it does. You don't even know if it's isolated from your "smart" operating system.

On a side note, mobile operating systems have a security advantage that almost all modern desktop operating systems (even most major linux distributions) lack. All applications are sandboxed. So even if you are running a malicious application (you know, like [Angry Birds](http://www.theregister.co.uk/2014/01/27/leaking_smartphone_apps_nsa_gchq/)) it may do various unwanted things regarding your personal mobile usage (eg. track location) but it can't easily steal your PGP private key stored inside [OpenKeyChain](https://www.openkeychain.org/about/)'s isolated storage. Not many desktop operating systems can protect you from a malicious application getting access to your `.gnupg` or `.ssh` folder.

So, although these two points are completely valid and indeed mobile smartphones are less secure, we have to realize that this is where most users read their emails. In many cases, a mobile phone is the only device people read their emails. Many people have come to cryptoparties, and after getting in touch with the complete lack of usability that comes with the standard pgp gui stack (Thunderbird + Enigmail), they ask how the can do the same things on their mobile. Most hackers would react (or even deny to help) exactly because of the reasons mentioned above. Let me clear up the dilemma a bit: Most people have two options to choose. Either use email encryption on their mobile phone or don't use encryption at all. And **unfortunately most hackers fail to see that for most people the threat model is passive surveillance**.

#### **Threat Model**

Not all people are trying to protect from the same things or the same type of adversaries. Not all people have the same [Threat Model](https://ssd.eff.org/en/glossary/threat-model).

I was very pleased to see Werner Koch presenting at [32c3](https://events.ccc.de/congress/2015/wiki/Main_Page) this year about the current status of [GnuPG](https://gnupg.org/), where he mentioned that the focus from now on is the passive surveillance threat model. **Building tools that focus on the passive surveillance threat model, means that usability and encryption by default is top priority.**

I have participated and co-organized many [Cryptoparties](https://www.cryptoparty.in/athens), [Free Software Meetups](http://wiki.fsfe.org/groups/Athens), and related crypto/privacy events/workshops. And I believe that the passive surveillance threat model should also be our focus. Yes, sometimes we need to quickly determine if a person has a different threat model (eg. journalists), but most people participating in these kind of events are not targets (at least not NSA targets). We know that they collect everything, we know that [they love pgp](http://www.theregister.co.uk/2016/01/27/nsa_loves_it_when_you_use_pgp/) because it's rarely used and stands out. **Let's make their job more difficult. Encrypt all things by default. Let's start  from fighting against massive passive surveillance.**

<hr>

*Comments and reactions on [Diaspora](https://librenet.gr/posts/582762) or [Twitter](https://twitter.com/comzeradd/status/694082702815989760)*
