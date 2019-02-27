---
layout: post
title: Video Highlights
date:  2013-06-06 01:00:00 -08:00
categories: acorn
---

At Athena, we strive to make explanations intuitive and accessible so that knowledge can be spread easily. There are lots of great explanations embedded within longer video lectures, so we built [Acorn](http://acorn.athena.ai) -- our media remixer -- to find and share them.

Recently, we wanted to address a particular problem when people share knowledge through video. Sometimes we get emails like this:

![](http://static.benet.ai/skitch/Sparrow-20130608-015203.png)

Sometimes they have diagrams:

![](http://static.benet.ai/skitch/Sir_Ken_Robinson__Do_schools_kill_creativity%3F_-_YouTube-20130608-014755.png)

Not so good.

## Introducing: Highlights for Video

Today, we shipped a small but powerful feature to [Acorn](http://acorn.athena.ai):

> Highlights: mark and note parts of videos.

<iframe width="600" height="338" src="http://acorn.athena.ai/embed/hhjgxvizys?show=content:paused" scrolling="no" frameborder="0" allowfullscreen="yes" webkitallowfullscreen="yes" mozallowfullscreen="yes"></iframe>

With highlights, you can "point out" specific sections of video. Whether for yourself in the future or for others you're sharing with, you can draw the viewer's attention to the parts you care about.

Highlights are similar to YouTube annotations or SoundCloud comments, but they work on any video compatible with Acorn. And they're scoped (see below). Let's take an in-depth look:

### Marking the Timeline Attracts Focus

Acorn highlights are shown as yellow marks hovering over the playback timeline. They draw attention to the relevant parts, and inform the viewer where the intended messages are.

![](http://static.benet.ai/skitch/acorn_%7C_media_remixer-20130608-020135.png)

### Active Highlights Improve Viewing Experience

As viewers, _sometimes_ we want to jump directly to the highlighted part, and _sometimes_ we want to watch the whole video. Our highlights allow both. You can watch the whole video as usual, now aware of where the important parts are. Or you can click on a highlight, and jump directly to the relevant part.

![](http://static.benet.ai/skitch/acorn_%7C_media_remixer-20130608-015748.png)

### Highlight Notes Improve Navigation

Acorn highlights are also a way of noting video sections, or even indexing what can be found in the video. Highlights can have a short note that displays as playback reaches a highlighted part, and as users inspect (hover near) the highlight.

<iframe width="600" height="340" src="http://acorn.athena.ai/embed/doproxyntt?show=content" scrolling="no" frameborder="0" allowfullscreen="yes" webkitallowfullscreen="yes" mozallowfullscreen="yes"></iframe>

### Scoped Highlights

One of the problems with YouTube annotations is that they're global. Either you see all annotations on a video, or none. With Acorn, anyone can create and share _different_ sets of annotations on top of the same video.

![](http://static.benet.ai/skitch/acorn_%7C_media_remixer-20130608-021928.png)
![](http://static.benet.ai/skitch/acorn_%7C_media_remixer-20130608-022114.png)

## Enough! How do I use it!?

Here's how you can add highlighting to a video in seconds:

1. Go to [http://acorn.athena.ai/new](http://acorn.athena.ai/new) and paste the link to the video you want to highlight.
2. Click `+ Highlight`, this adds a highlight, and lets you edit it.
3. Adjust the highlighted clip with the sliders (click the green checkbox when done)
3.5. Add a text note (optional)
4. Save, and Share it!

<iframe width="600" height="575" src="http://acorn.athena.ai/embed/palifzkrgt?show=content:paused" scrolling="no" frameborder="0" allowfullscreen="yes" webkitallowfullscreen="yes" mozallowfullscreen="yes"></iframe>

Note: the highlight creation experience is still rough -- it ought to be smoother and simpler. But this is our first pass at it :). Expect it to get better -- if you have design suggestions, [let us know](https://github.com/athenalabs/acorn-player/issues)!

### Programmatic Highlighting?

Some users have a many videos to highlight, and already know the time codes of the relevant parts. Well, you're in luck! As [described in an earlier post](http://blog.athena.ai/2013/05/13/one-player-to-play-them-all.html), Acorn stores media playback data as simple `json` objects. Thus, you can create highlights by generating Acorn `json`.

For example, take a look at the following Acorn `json`. Note the `highlights` array, and that each highlight is a dictionary with `timeStart`, `timeEnd`, and `title`.

```json
{
  "acornid": "hhjgxvizys",
  "shell": {
    "highlights": [
      {
        "timeStart": 165,
        "title": "Whaaaale",
        "timeEnd": 167
      },
      {
        "timeStart": 22,
        "title": "Little Psy",
        "timeEnd": 29
      },
      {
        "timeStart": 130,
        "title": "Metro",
        "timeEnd": 153
      }
    ],
    "shellid": "acorn.HighlightsShell",
    "shell": {
      "loops": "one",
      "shellid": "acorn.YouTubeShell",
      "timeEnd": 253,
      "timeTotal": 253,
      "timeStart": 0,
      "link": "http://www.youtube.com/watch?v=9bZkp7q19f0"
    },
    "description": "Remix of \"PSY - GANGNAM STYLE\".",
    "thumbnail": "https://img.youtube.com/vi/9bZkp7q19f0/0.jpg",
    "title": "PSY - GANGNAM STYLE - Funniest Parts"
  },
  "owner": "juan",
  "thumbnail": "http://acorn.athena.ai/img/acorn.png",
  "created": "2013-06-08 07:51:32.444176",
  "updated": "2013-06-08 07:51:32.444176"
}
```

You can add a highlight by inserting its representation (dictionary) into the `highlights` array. Here we added the `Elevator Guy` highlight:

```json
{
  "acornid": "hhjgxvizys",
  "shell": {
    "highlights": [
      {
        "timeStart": 114.5,
        "title": "Elevator Guy",
        "timeEnd": 123
      },
      {
        "timeStart": 165,
        "title": "Whaaaale",
        "timeEnd": 167
      },
  ...
}
```

## Why is highlighting important?

Highlighting is one of the main forms of interaction with text. Pick up an avid reader's books or printed papers and you'll see this:

![](http://static.benet.ai/skitch/skitched-20130608-031524.png)

![](http://static.benet.ai/skitch/skitched-20130608-031137.png)

These humble markings are powerful. A simple background color shift demands attention, and implies importance. Scrawls jotted along margins suggest new ideas, or remind us of old ones.

These are recordings of our focus, of our thoughts.
These are conversations, with the author, ourselves, and other readers.
These are the shadows of ideas harmonizing together.

They are such an important part of the "_text experience_" that most widely used digital reading tools include a virtual version of highlighting:

![](http://static.benet.ai/skitch/skitched-20130608-031957.png)

But, why is this important experience limited to text?

No equivalent interaction existed with audio or video. The reason is obvious: these media (audio and video) had fundamentally different beginnings from text; they emerged ephemeral and broadcasted. There was no _highlight marker_ for Radio or TV. No _pen_ could annotate the information packets representing sounds or images. The technology simply didn't exist.

With computers, we can suddenly interact with video and audio as much as we interact with text. Over time, powerful video editing software began adding annotation features. Video creators could add notes, highlights, and sketches on top of video. But this has remained exclusively the realm of video _creators_, not _viewers_. To match the text experience, viewers should be able to *easily* and *quickly* annotate or highlight the videos they watch.

In building Acorn, we realized that the simple and powerful human interfaces we use for text (highlight markers, pens) can carry over to the web. In seconds we can "mark" a timeline to highlight a video section. And we can add "margin notes" just the same. So we had to build it! We're proud to move the web forward with our first stab at video annotations -- yes, there's more to come :)

## The Annotated Web

Marc Andreessen talks about how [annotations were originally built into Mosaic](http://news.rapgenius.com/1105129/Marc-andreessen-why-andreessen-horowitz-is-investing-in-rap-genius/Mosaic). Unfortunately, the primeval browser lost that paradigm, but perhaps we can bring it back. Today, Evernote clips text and images, RapGenius annotates texts, and now Acorn highlights video. Others are coming -- join the conversation at [iannotate](http://iannotate.org/)!

The web is starting to bloom with the traces of our thoughts. Perhaps soon, we might just realize the *annotated trails* of Vannevar Bush's  [Memex](http://en.wikipedia.org/wiki/Memex).

Let's just avoid carrying over this madness:

![highlight-all-the-things](http://static.benet.ai/skitch/skitched-20130607-035606.png)
