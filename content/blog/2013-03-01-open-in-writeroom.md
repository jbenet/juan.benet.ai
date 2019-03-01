---
layout: post
title:  Open in WriteRoom from Command Line
date:   2014-03-02 04:12:00 -08:00
categories: note
---

I like using [WriteRoom](http://www.hogbaysoftware.com/products/writeroom). I wanted `$ wr <file>` to open `<file>` in WriteRoom, and _Enter Full Screen Single_. So I wrote it. Just put the script below in your `$PATH`, say `/usr/bin/wr`:

```
curl https://gist.githubusercontent.com/jbenet/9271733/raw/wr > wr
chmod +x wr
sudo mv wr /usr/bin/wr
```

<script src="https://gist.github.com/jbenet/9271733.js"></script>
