---
layout: post
title:  TikZ Liquid Tag Block
date:   2014-04-09 17:12:25 -08:00
categories: note
---

I wrote a TikZ Liquied Tag Block (to use with Jekyll). It uses my [`tikz2svg`]({% post_url 2014-03-09-tikz2svg %}). If you have questions, [post in the gist](https://gist.github.com/jbenet/10332368) and send me an email (gist does not notify). Cheers!

## Install

- [Install `tikz2svg`](http://juan.benet.ai/note/2014-03-09/tikz2svg/#install).
- Put `tikz_tag.rb` in your `_plugins/` directory.

## Usage

Add a TikZ block:

```liquid
{% raw %}<div class="svg">
{% tikz %}
\begin{tikzpicture}
  \fill[red!90!black]   ( 90:.6) circle (1);
  \fill[green!80!black] (210:.6) circle (1);
  \fill[blue!90!black] (330:.6) circle (1);
\end{tikzpicture}
{% endtikz %}
</div>{% endraw %}
```

Note: the `<div>` is necessary, as otherwise markdown preprocessing will mess with the TikZ. The block above renders into:

(Note: This broke, i'm using hugo now, not jekyll.)

```
<div class="svg">
{% tikz %}
\begin{tikzpicture}
  \fill[red!90!black]   ( 90:.6) circle (1);
  \fill[green!80!black] (210:.6) circle (1);
  \fill[blue!90!black] (330:.6) circle (1);
\end{tikzpicture}
{% endtikz %}
</div>
```


<script src="https://gist.github.com/jbenet/10332368.js"></script>
