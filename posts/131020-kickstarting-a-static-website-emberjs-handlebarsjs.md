title: Kickstarting a static website with ember.js and handlebars.js
date: 2013-10-20 22:59:13
type: post
slug: kickstarting-a-static-website-emberjs-handlebarsjs
tags: opensource, webmaker, mozilla, frontend
status: draft
---

Sometimes you want to build quickly a static website. No need for a backend or a static content generator. But you come to a point where you want to introduce some simple features and you get annoyed mostly because you have to duplicate things. You have the same footer copied on every page or you have a list of items (pages) and you wish you could have the same template for all of them and get these items serialized in some way (the only way: json).

[Ember.js](http://emberjs.com/) (which includes [handlebars.js](http://handlebarsjs.com/)) can really come in handy in these situations. I started using it for the first time when I wanted to build a simple static website for archiving Athens Friday night bike rides, known as [freeday](http://freedayride.gr/). And since it proved to be the right choice I'm keep using it every time I want to design something similar.

So in order to minimize the time I spend kickstarting such a website, I pushed a few bits of code that can serve as a starting point. Just check the [repo](https://github.com/comzeradd/static-ember) and see how it [looks like](http://comzeradd.github.io/static-ember/).


PS. Of course ember.js is much more than this. If you are interested for more see this [video](https://www.youtube.com/watch?v=1QHrlFlaXdI) and then dive into the [documentation](http://emberjs.com/guides/).
