title: Fedora Flock 2014
date: 2014-08-13 15:51:54
type: post
slug: fedora-flock-2014
tags: opensource, fedora, event
---

Fedora Flock took place last week and this is a log entry for my personal highlights.

<a href="https://www.flickr.com/photos/comzeradd/14671187430" title="Flock 2014 by Nikos Roussos, on Flickr"><img src="https://farm6.staticflickr.com/5575/14671187430_7c5c5ef531_m.jpg" class="txt" width="180" height="240" alt="Flock 2014"></a> Overall the Flock was awesome. The quality of all technical presentations/workshops was really high. It's amazing how many things currently going on at the Fedora community, not just related to our Operation System (the distribution) but also innovative things that we develop or lead that in the long run benefit the whole Free Software community. As always I had the chance to meet, talk and collaborate in person with many Fedorians and that's always motivating for my contribution to the project.

So here it goes...

[Fedora.next](https://fedoraproject.org/wiki/Fedora.next): This is currently the most important thing happening regarding the distribution. We are about to release Fedora 21 in three different products (Workstation, Cloud, Server) that will make possible to offer a better user experience in each one of these user groups. Some features that pop into my mind: Server product will implement "Server roles" right on the Anaconda installer, so you can quickly deploy (for instance) a mail server. [Cockpit](http://cockpit-project.org/) also will land on 21, an awesome server management tool. Cloud product will focus even more on containers (yes that means docker), open source infrastructure (eg. [OpenStack](http://www.openstack.org/)) and cloud services (eg. AWS). Workstation product intended for Desktop users and will focus on developers and makers. [DevAsistant](http://devassistant.org/) will play a key role to this. It always surprise me to see developers struggle to setup their work environment on Operating Systems that takes hours to do it, for things that it's a few minutes work on Fedora.

<blockquote class="twitter-tweet" lang="en"><p>People running <a href="https://twitter.com/hashtag/Docker?src=hash">#Docker</a> inside <a href="https://twitter.com/hashtag/Vagrant?src=hash">#Vagrant</a> over OsX. A new level of masochism.</p>&mdash; Nikos Roussos (@comzeradd) <a href="https://twitter.com/comzeradd/statuses/468398793894133760">May 19, 2014</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Docker, docker, docker: [Aditya](https://twitter.com/adityapatawari) did a great introductory workshop during Flock. Fedora is definitely the leading platform for Docker. Next release will improve even better Docker's integration.

Ansible: Another DepOps area where Fedora community has given a lot of time and effort. Again Aditya did an introductory talk, since recently the Infrastructure team migrated [everything](http://infrastructure.fedoraproject.org/cgit/ansible.git) from Puppet to Ansbile. The last day [Praveen](https://twitter.com/kumar_pravin) did a workshop demonstrating in practice how Ansible can be combined with Jenkins for Continuous Integration.

Packaging: One way that I contribute to the project is through RPM Packaging, so I tried to participate in most of the relevant talks/workshops. Amita Sharma walked us through the Fedora QA workflow, Jan Zeleny presented the roadmap for RPM and Dnf (the yum replacement), Haïkel Guémar coordinated a review package hackfest and Cole Robinson showed how packagers can utilize Virtualization tools for testing things.

Communications: New communication and collaboration tools are on the way. This is not directly related to the project, but it's Fedora people who drive the development on these. [Hyperkitty](https://fedorahosted.org/hyperkitty/) will be the web interface for the upcoming Mailman3, [Waarta](https://www.waartaa.com/) is a web app for IRC/WebRTC and [Glitter Gallery](http://www.glittergallery.net/) is a collaboration platform for designers which uses git as backend and SparkleShare as the sync client (I maintain the package for Fedora, so I'm really interested to see how this will go).

Novena: [Sean Cross](https://twitter.com/xobs) gave a keynote speech about the [Novena](http://www.kosagi.com/w/index.php?title=Novena_Main_Page) project, the fully Open Source laptop. Still in the beginning, but seems really promising.

<p class="text-center">
<iframe src="https://www.flickr.com/photos/comzeradd/14842603975/in/set-72157645862758620/player/" width="500" height="383" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>
</p>
