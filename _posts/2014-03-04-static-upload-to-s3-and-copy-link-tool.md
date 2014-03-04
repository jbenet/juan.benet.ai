---
layout: post
title:  static - Upload to S3 and copy link tool
date:   2014-03-04 05:53:59 -08:00
categories: note
---

I use a script to upload files to an S3 bucket and copy the link to the clipboard. Basically:

```
static <file> [<s3path>]
```

## Example:

```
jbenet @ lorien : /tmp % static 24898.png nocturne.png
> cat 24898.png | pyhash sha1
> echo "http://jbenet.static.s3.amazonaws.com/d7b220c/nocturne.png" | pbcopy
> aws s3 cp --profile juanbenet "24898.png" "s3://jbenet.static/d7b220c/nocturne.png"
> afplay /System/Library/Sounds/Ping.aiff

http://jbenet.static.s3.amazonaws.com/d7b220c/nocturne.png
```

## How it works:

1. hash (sha1) the file for the url
1. `http://<bucket>.s3.amazonaws.com/<sha1>/<s3path or basename(<file>)>`
1. copy the url to clipboard; done before upload, so you can paste right away
1. upload the file to the s3 bucket
1. play a sound to announce completion

## Install:

```
# install pyhash
curl https://gist.github.com/jbenet/6502583/raw/pyhash.py -o pyhash
chmod +x pyhash
sudo mv pyhash /usr/bin/pyhash

# install static
curl https://gist.github.com/jbenet/4b2e282eba5a1bf291b7/raw/static > static
chmod +x static
sudo mv static /usr/bin/static
```

<script src="https://gist.github.com/jbenet/4b2e282eba5a1bf291b7.js"></script>
