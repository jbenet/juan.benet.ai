---
layout: post
title:  Format Conversion
date:   2014-03-07 04:11:31 -08:00
categories: data
vocab: /data/2014-02-21/data-management-vocabulary/
---

<div class="alert alert-danger">
  <h1>Warning: Work In Progress</h1>
</div>

File conversion is cumbersome and more complex than it needs to be. There is no good reason why we need thousands of different programs that convert from one format to another. I claim it is possible to create a program which **converts to and from _all_ formats without sacrificing performance or flexibility**.[^proof]

[^proof]: At present, I offer a framework to think about the problem. In the future, I hope to offer an existence proof.

## Semantics

Before describing such a program, it is important to define our semantic framework. It strikes me that people use the words `encoding`, `format`, and `schema` too loosely. This is perhaps because the words and their semantic boundaries are not precisely defined. Here are ours:

- [schema]({{ page.vocab }}#schema): the structure, or specification of how information represents meaning.

- [format]({{ page.vocab }}#format): "the way in which something is arranged"; a specification for how to `encode` and `decode` a message.

- [encoding]({{ page.vocab }}#encoding): the process of converting _information_ into _encoded information_, according to a `format`. The inverse of `decoding`.

In general, we can say that data is structured according to a `schema`, and `encoded` into a [`format` compatible with the `schema`]({{ page.vocab }}#schema-format-compatibility).

## Problem

Using these definitions, then, the program should convert any [compatible format]({{ page.vocab }}#format-compatibility) into another.

Conversion tools between two general formats are not complicated to build. The hard part about building a conversion tool for _all_ formats is that most formats are not general. They are [_schema-laden_]({{ page.vocab }}#schema-laden), and are thus not perfectly compatible. Parsing and generating byte sequences is tedious and error-prone, but not hard. The real problem, I claim, is _converting between schemas_.

## The Graph of Formats

Today, most format conversions happen via format-pair-specific tools. Examples: "json to xml", "png to jpg", "xsl to csv". Actually, these examples are not quite right, because most "format conversions" are not between [universal  formats]({{ page.vocab }}#universal-format), but rather between [_schema-laden_ formats]({{ page.vocab}}#schema-laden}). This means tools that convert from "this custom format expressing geometries" to "GeoJSON", or between csvs with different column sets, or value ranges. For example:

```csv
% cat area-codes.csv
CITY,STATE,AREACODE
SAN DIEGO,CA,619
SAN FRANCISCO,CA,415
SAN JOSE,CA,408

% ./us-city-codes.py area-codes.csv
City,Dial Code
San Diego,+1-619
San Francisco,+1-415
San Jose,+1-408
```

This transformation is trivial: (a) the `STATE` column was dropped, (b) the casing changed, (c) the `AREACODE` column shifted to `Dial Code`, which includes a `+1-` for international calling. And yet, a custom program had to be written to parse the source file and generate the target file. Chances are every time this had to be done, someone had to write a program to create that conversion. Consider more complex format conversions, with files with dozens of columns or deeply nested JSON or XML trees, with numerous transformations here and there. So much valuable time is wasted creating these conversion programs. More is wasted by end users -- particularly non-programmers -- struggling to wrangle data to make it "look right". This is silly.

Consider a graph of formats where directed edges represent conversion programs. Every time one format needs to be converted into another, a program is written and an edge is added. Sometimes people publish those programs and they can be found on the internet. And if we're lucky, it's possible a conversion through an intermediate format exists. This is a pretty brittle system though. Often, programs do not exist, only work one-way, are out of date, or are written again and again but never published anywhere.

<!-- format graph -->

## Hub with Universal Data Representation

Instead of using a graph with converter edges between formats, consider a hub graph, where the center node is a "master" format that can then be translated to any other format. While it is ambitious to build _one_ format to convert between all other formats losslessly, the benefits are significant. Rather than building `<num formats>^2`[^num-max] tools to convert to-and-from, we would only need to build `<num formats>`.

[^num-max]: Maximum, of course. Many converters would never be built as most format pairs are incompatible.

(Figure of hub here)

\begin{scope}[mindmap, concept color=orange, text=white]
  \node [concept] {Informatique}[clockwise from=-5]
    child {node [concept] (log) {M{\'e}thodes cat{\'e}goriques}}
    child {node [concept] (alg) {Algorithmique}}
    child {node [concept] (cod) {Compression \& transmission}}
    child {node [concept] (img) {Tra{\^i}tement des images}}
    child {node [concept] (opt) {Optimisation}}
    child {node [concept] (res) {R{\'e}seaux}};
\end{scope}


### Hub is Well Established

This is not new. Compilers have worked with a similar model. Compilers like [LLVM](http://llvm.org) take high-level languages, parse them into an Internal Representation (IR), and then emit machine code for the relevant platform. This _three-phase design_ is a great way to address the multiplicity of target architectures and source languages.[^other-reasons] Rather than building `<langs> * <archs>` compilers, build one compiler with `<langs> + <archs>` modules.

![llvm-three-phases](http://jbenet.static.s3.amazonaws.com/f44a8a0/llvm-three-phase-design.png)

<!-- Figure from [the AOSA book](http://www.aosabook.org/en/llvm.html). -->

[^other-reasons]: This compiler design is brilliant for many reasons. It  addresses many challenges elegantly, including applying optimization at the IR level, and even [distributing IR code as "portable" code](http://www.chromium.org/nativeclient/pnacl/introduction-to-portable-native-client) that is compiled on-demand at the target machines.

This is not even new to conversion. Conversion tools our there already employ this design. Notably, [Pandoc](http://johnmacfarlane.net/pandoc/) converts text documents between a range of markup languages. Though the Pandoc homepage displays a [graph with `Source * Target` edges](http://johnmacfarlane.net/pandoc/diagram.png), it perhaps should display a hub graph; its design uses parsers, an internal representation, and emitters:

> Pandoc has a modular design: it consists of a set of readers, which parse text in a given format and produce a native representation of the document, and a set of writers, which convert this native representation into a target format. Thus, adding an input or output format requires only adding a reader or writer.
> <small class="align-right">Pandoc Documentation</small>

These widely used and well-established software systems use the hub model successfully.

### Hub Design

To concretely specify the design, the Hub Design calls for:

1. a Universal Data Representation capable of handling _any_ data format (ambitious).
2. a module per format, which converts to and from the UDR.
3. a tool that loads and runs format modules, to facilitate conversion.

Building such a Universal Data Representation (UDR) is hard; we need a format that can express _every other format_ well and efficiently (in storage and conversion computation). Building the modules themselves -- which do the heavy lifting -- should be an easy and straightforward process. Modules could either ship with the base tool (better for end users, but centralized), or shipped independently (falling back to maintaining an index). Of course, the UDR can be piped in and out of format converters manually, but this would [do little to shift the status quo](https://xkcd.com/927/). The adoption of this tool, and the benefits of this system, depend on:

- a modular architecture facilitating the building of format modules.
- a wide set of interfaces to simplify usage (CLI, static lib, language bindings, web API)
- an open-source project and community to build the modules.[^dev-hostility]

[^dev-hostility]: It is important to emphasize these points because they are so often overlooked. Many elegant software projects have failed due to the lack of an interested community, a hostile codebase, or a difficult usage pattern.

Though the UDR is a non-trivial question, from a software engineering perspective, I claim this design is much easier to realize than others.
