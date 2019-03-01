---
layout: post
title:  XML Stifles The Semantic Web
date:   2014-03-09 04:49:53 -08:00
categories: note
---

I'm coming to think that Semantic Web adoption has been significantly stifled by XML being the main (transport) format. I mean, look at this

```xml
<?xml version="1.0" encoding="utf-8"?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
         xmlns:dc="http://purl.org/dc/elements/1.1/">
  <rdf:Description rdf:about="http://www.w3.org/TR/rdf-syntax-grammar">
    <dc:title>RDF/XML Syntax Specification (Revised)</dc:title>
  </rdf:Description>

  <rdf:Description rdf:about="http://example.org/buecher/baum" xml:lang="de">
    <dc:title>Der Baum</dc:title>
    <dc:description>Das Buch ist außergewöhnlich</dc:description>
  </rdf:Description>
</rdf:RDF>
```

versus this

```json
{
  "@context": {
    "dc": "http://purl.org/dc/elements/1.1/"
  },
  "@graph": [
    {
      "@id": "http://www.w3.org/TR/rdf-syntax-grammar",
      "dc:title": "RDF/XML Syntax Specification (Revised)"
    },
    {
      "@id": "http://example.org/buecher/baum",
      "@language": "de",
      "dc:description": "Das Buch ist au\u00dfergew\u00f6hnlich",
      "dc:title": "Der Baum"
    }
  ]
}
```

One of these makes my eyes bleed, and parsers weep. Perhaps, now that [json-ld](http://json-ld.org) exists and websites are using JSON ubiquitously, we can start linking data robustly. We shall see!
