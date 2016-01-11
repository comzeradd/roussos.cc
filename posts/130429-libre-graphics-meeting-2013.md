title: Libre Graphics Meeting 2013
date: 2013-04-29 15:13:28
slug: libre-graphics-meeting-2013
type: post
tags: opensource, design, mozilla
---

[![open design](https://farm9.staticflickr.com/8100/8659115880_f3708afc66.jpg)](http://www.flickr.com/photos/comzeradd/8659115880/)
<div align="center">_"Fuck commitees, I believe in lunatics" ~ Tibor Kalman_</div>
<br />

<a href="http://www.flickr.com/photos/comzeradd/8659179138/" target="_blank"><img src="https://farm9.staticflickr.com/8122/8659179138_13bf29e8a8_q.jpg" class="txt" /></a> The [**Libre Graphics Meeting**](http://libregraphicsmeeting.org/2013/) (LGM) is an annual gathering for the discussion of free and open source software used for design, illustration, typography, lay-out, art, photography, publishing, cartography, animation and video.

For years I wanted to participate and this year I finally did it. I had a presentation about [Popcorn Maker](http://popcorn.webmaker.org/) and how people can use it to remix videos and teach others how to be web makers.

Check out my full Popcorn Maker presentation below and the full [photo album](https://secure.flickr.com/photos/comzeradd/sets/72157633271119214/).


<iframe src="http://www.rvl.io/comzeradd/make-popcorn/embed" height="420" width="576" allowfullscreen="" frameborder="0" scrolling="no"></iframe>
<br />

On the front wall of the Medialab Prado (the host venue) there was a 15-meter wide LED facade displaying processing.js artworks. A special [online editor](http://programalaplaza.medialab-prado.es/) was created for people to submit "code" for this installation. Below is my simple humble contribution (inspired by [similar music scene](https://www.youtube.com/watch?v=H4Kgzn3tDQU) from a favorite movie :P). 
    
    void setup() {
      size(192, 157); 
      background(0); 
      frameRate(7);
    
      noStroke();
      colorMode(HSB); //HSB mode to have beautiful random colors
    }
    
    void draw () {
      x = Math.round(random(192)/16);
      y = Math.round(random(160)/16);
      fill(random(255), 200, 200);
      rect(x*16, y*16, 16, 16);
    }

See the video below for more cool creations.

<iframe src="http://player.vimeo.com/video/64292342?portrait=0" height="310" width="550" allowfullscreen="" frameborder="0"></iframe>
