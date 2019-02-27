---
layout: post
title: One Player to Play Them All
date:  2013-05-13 01:00:00 -08:00
categories: acorn
---

_The Lord of the Rings_ is one of my favorite books. This little-known tale of adventure features an amazingly powerful ring, bearing an enchanted inscription that reads:

    Ash nazg durbatulûk, ash nazg gimbatul,
    Ash nazg thrakatulûk agh burzum-ishi krimpatul.

That's in [orcish](http://acorn.athena.ai/dyzemxzogd), a most soothing language. It loosely translates to:

    One player to play them all, one player to detect them,
    One player to embed them all and in your webpage play them.

How or why a ring of power forged in the fires of a terrible active volcano ages ago would bear such prescient web-development advice, we'll never know. But we have heeded it. We have answered J.R.R. Tolkien's call for a powerful media player that can leverage all other media players, to play _anything_.

## The birth of Acorn-Player

At Athena, we need to collect the world's best explanations for all knowledge. These explanations are strewn across the web, in all sorts of formats. One YouTube video features Feynman explaining
[what heat is](http://www.youtube.com/watch?v=v3pYRn5j7oI). Another video, in Vimeo this time, explains "[What is a flame?](http://vimeo.com/40271657)" Beyond video, there are scores of [images](http://static.benet.ai/skitch/conditional-probability-20130513-124137.png), [documents](http://www.ohio.edu/people/williar4/html/HapEd/NSF/Phys/Newton.pdf), [interactive webpages](http://acko.net/blog/how-to-fold-a-julia-fractal/), and so on.

We needed a way to allow our users to input _ANY_ link to the explanations they find across the net, and embed them uniformly. In particular, the embedding should be smart: links to videos should embed only the video, regardless of the hosting service (and their particular embed code). Moreover, one ought to be able to clip the video and embed only the relevant part.

We looked around the web to find existing javascript libraries that would do such things. We figured that since sites like facebook and twitter do some smart embedding, there would be an open source library to help us. But to our surprise we found none! So... we wrote one.


## What is it?

[Acorn-Player](https://github.com/athenalabs/acorn-player) is an open-source JS/CSS/HTML library that:

1. recognizes how to properly embed all kinds of links
2. provides a uniform player interface
3. can remix media (more on that in later posts)

The github repo is at:
[https://github.com/athenalabs/acorn-player](https://github.com/athenalabs/acorn-player)

You can see it in action at:
[https://acorn.athena.ai](https://acorn.athena.ai)

And it looks like this:

<iframe width='600' height='400' src='//acorn.athena.ai/embed/xwkbokwxti' scrolling='no' frameborder='0' allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>

## How do I use it?

So Acorn-Player can take _any_ sort of media link and embed it correctly in your website. You can see the types of media it recognizes specially [here](https://github.com/athenalabs/acorn-player/tree/master/coffee/src/shells) (the worst case is a simple iframe). Right now, it's not that smart yet, but the infrastructure is all in place and now it's learning about more and more kinds of media. It also lets you combine those pieces of media in various ways: playlists, galleries, spliced videos, and more.

You can use it in two ways:

### Embed Acorns in your Website

You can make and save acorns at [https://acorn.athena.ai](https://acorn.athena.ai). You can then embed them with code like this:

```html
<iframe width="600" height="400" src="http://acorn.athena.ai/embed/wijkrivqtr" scrolling="no" frameborder="0" allowfullscreen="yes" webkitallowfullscreen="yes" mozallowfullscreen="yes"></iframe>
```


### Add `acorn-player.js`

You can add the library to your website (see [github repo](https://github.com/athenalabs/acorn-player) for details), and then
create and embed acorns like this:

```javascript
// with just a link
link = 'http://www.youtube.com/watch?v=CbIZU8cQWXc';
player = new acorn.player.Player({ data: link });
player.appendTo($('body'));
```

```javascript
// or with more complicated data
player = new acorn.player.Player({ data: {
  "acornid": "new",
  "shell": {
    "shell": "acorn.YouTubeShell",
    "link": "http://www.youtube.com/watch?v=CbIZU8cQWXc",
    "timeStart": 160,
    "timeEnd": 320
  },
}});
player.appendTo($('body'));
```


## How does it work?

Acorn-Player plays `acorns` (surprise!). What are `acorns`? They are data-representations of web media. Acorn-player takes these as input, and transforms them into playable media. For example, see these JSON `acorns` and what happens when they're fed to acorn-players:

```json
// an acorn that plays a youtube video
{
  "shell": {
    "shell": "acorn.YouTubeShell",
    "link": "http://www.youtube.com/watch?v=CbIZU8cQWXc",
    "timeStart": 160,
    "timeEnd": 320
  }
}
```

<iframe width='600' height='400' src='//acorn.athena.ai/embed/ozqjmhmomv' scrolling='no' frameborder='0' allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>

```json
// an acorn that displays an image
{
  "shell": {
    "shell": "acorn.ImageShell",
    "link": "http://static.benet.ai/t/purpose.png"
  }
}
```


<iframe width='600' height='480' src='//acorn.athena.ai/embed/ecqknmozkr' scrolling='no' frameborder='0' allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>


```json
// an acorn that displays a playlist
{
  "shell": {
    "shell": "acorn.CollectionShell",
    "shells": [
      {
        "shell": "acorn.YouTubeShell",
        "link": "http://www.youtube.com/watch?v=CbIZU8cQWXc"
      },
      {
        "shell": "acorn.YouTubeShell",
        "link": "http://www.youtube.com/watch?v=BFO2usVjfQc"
      },
      {
        "shell": "acorn.YouTubeShell",
        "link": "http://www.youtube.com/watch?v=WlGemHL5vLY"
      },
      {
        "shell": "acorn.VimeoShell",
        "link": "http://vimeo.com/38101676"
      }
    ]
  }
}
```

<iframe width='600' height='400' src='//acorn.athena.ai/embed/wijkrivqtr' scrolling='no' frameborder='0' allowfullscreen webkitallowfullscreen mozallowfullscreen></iframe>



## And what else?


Acorn-Player is a work in progress. It is already pretty powerful, but there is so much more we have planned for it. This is just the beginning. Go check out the [github repo](https://github.com/athenalabs/acorn-player), and see what we're working on now, what's coming soon, etc.

And, it's open-source! So please report issues + send us pull requests.

We also built a free web service, [https://acorn.athena.ai](https://acorn.athena.ai), to store `acorn` data. More on that later :).
