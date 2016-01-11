title: monopati, a minimalistic static content generator
date: 2016-01-11 17:01:12
slug: monopati
tags: opensource
---

I have tried many static content generators in the past. My site/blog is rendered to static since a couple of years ago. So this post is about writing yet another static content generator.

I have two major requirements. Simplicity and no extra features. All I want is a simple blog and some static pages. So [Markdown](https://en.wikipedia.org/wiki/Markdown) and [Jinja](http://jinja.pocoo.org/) should be enough. No fancy features needed. I also wanted this to be so simple that even non-tech people would use it with minimum effort. One of the things that bothers me with most generators is that they render the whole website in another folder, so it's hard to have one repository with both your posts markdown code and the rendered output so you can easily host it (eg. on [Github pages](https://pages.github.com/)).

So I scratched my itch and [monopati](https://github.com/comzeradd/monopati), a minimalistic static content generator, was born. As of today [my website](https://www.roussos.cc) is rendered using my own static content generator (with all content on [version control](https://github.com/comzeradd/comzeradd.github.io)). I promise to write a post with concrete easy steps on how to deploy your own website/blog using monopati and without paying for any hosting service.

Feedback and code patches are always welcomed.

<hr>

*Comments and reactions on [Diaspora](https://librenet.gr/posts/551310) or [Twitter](https://twitter.com/comzeradd/status/686564094762201089)*
