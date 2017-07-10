title: Building a minimal single page application with Vue.js + Webpack
date: 2017-07-10 20:27:00
slug: vuejs-webpack
tags: opensource, mozilla, frontend
files: vuejs.jpg
---

At Mozilla's Participation Systems team we have this [Small Uncontrolled Experiment](http://verraes.net/2014/10/small-controlled-experiments-revisited/), called Turing Day. What we do, is use one day in our two weeks sprint to work freely on stuff that are not directly connected to our projects and products. Hack stuff, learn new things and technologies, "sharp our saw" in order to increase our efficiency.

This post is about what I learned during one of these days with a bonus of something I built with that. For quite some time now I'm using [Bower](https://bower.io/) and [Gulp](http://gulpjs.com/) for frontend package management and I'm very happy with these tools. But since javascript tools landscape is constantly changing I wanted to get a more deep understanding of [Webpack](https://webpack.js.org/) too. Even Bower's official website suggests it these days!

"Learn by making" is a mindset very common at Mozilla, so I wanted to build something in the process and as a test-bed for trying out Webpack. So I decided to build a minimal reusable single page application, that can be really useful for all these times you just want to build a simple static website and you catch yourself doing the same stuff over and over again.

I picked [Vue.js](https://vuejs.org/) as the framework for this app. You can find many excellent blog posts out there on why Vue.js, instead of Angular or React. My personal take on a nutshell, is that Vue.js has the easiest learning curve, especially for people who code in JS but never touched a framework before. It has top-quality documentation, great community and its design principles and simplicity make your code really clean and readable, which make it easier for other people to get involved and contribute. No need to code ugly and bloated .jsx files with custom html entities (hey React!).

You can browse the [complete source code](https://github.com/comzeradd/vuejs-spa). If you are new to Vue.js navigate through the project to get familiar with the code structure. See how breaking out your application into components make it more clean and easy to understand and maintain. I intentionally added some css on some components to showcase how easily you can use js, html and css inside the same component.

Check out the webpack configuration file. I tried to keep it as simple as possible. We have an entry javascript file to declare our app and dependencies and output file to bundle everything.

    entry: './src/app.js',
    output: {
        path: path.resolve(__dirname, './dist'),
        publicPath: '/dist/',
        filename: 'bundle.js'
    },

We add all various loaders for the rest of our code and assets. You can add your linters here, to check your code during build (or even runtime). And of course your preprocessors (eg. sass).

Notice the vue-loader:

    {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: {
            loaders: {
                'scss': 'vue-style-loader!css-loader!sass-loader',
                'sass': 'vue-style-loader!css-loader!sass-loader?indentedSyntax'
            }
        }
    },

The nice thing with Webpack is that while building all vue components it will resolve all necessary dependencies declared there, and are not part of our entry js file, and bundle them too.

Now check index.html. That's our app. Really.

    <!DOCTYPE html>
    <html lang="en">
    <head>
      <title>vue.js spa</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="shortcut icon" href="./src/assets/img/favicon.ico">
    </head>
    <body>
    
      <div id="app"></div>
    
      <script src="/dist/bundle.js"></script>
    
    </body>
    </html>

Browsing through `src` folder you'll notice an `api` folder. I added a dummy json file and [axios](https://github.com/mzabriskie/axios), to give you an idea on how you could utilize an external API for your app's content.

    import axios from 'axios';
    
    export default class Api {
        static getItems() {
            return axios.get('/items.json');
        }
    }

Check out the router folder, which defines our app's urls and what component corresponds to each one.

As a bonus I added [moment](http://momentjs.com/) and [vue-markdown](http://miaolz123.github.io/vue-markdown/) to showcase the use of some filters we could use while rendering the content.

These are the runtime dependencies for this app (hey, no jquery!):

    "dependencies": {
        "axios": "^0.16.1",
        "bootstrap-vue": "^0.16.1",
        "moment": "^2.18.1",
        "vue": "^2.3.3",
        "vue-markdown": "^2.1.3",
        "vue-router": "^2.5.3"
    }

If you want to see it in action, install dependencies locally:

    yarn

Run it on development mode:

    npm run dev

Or build it for production:

    npm run build

![33c3](vuejs.jpg)

<hr>

*Comments and reactions on [Diaspora]() and [Twitter]()*.