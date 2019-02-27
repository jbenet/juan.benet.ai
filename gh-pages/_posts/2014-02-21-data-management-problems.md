---
layout: post
title:  Data Management Problems
date:   2014-02-21 06:57:58 -08:00
categories: data
---

Numerous problems plague data sharing today. This post identifies some of them. Note: to make sure we're on the same page semantically, check my [data vocabulary]({% post_url 2014-02-21-data-management-vocabulary %}).

## Distribution

Moving files from one computer to another is generally a solved problem. However, when dealing with datasets, there are complexities.

First, data files can be _large_ (100MB+), which makes distribution costly in terms of storage and bandwidth. Usually, only organizations (academic or commercial) commit to fronting the financial costs of storing, transmitting, and maintaining large datasets. For example, academic institutions maintain the most popular Machine Learning datasets (NIST, CIFAR, ImageNet, etc). However, thanks to new cloud storage solutions, the costs (both money and time) are dropping.

Second, unlike source code, few of the people that deal with data files are proficient in setting up reliable and robust distribution of their dataset files over the internet. Today, many scientists outside of computer science are using services like Dropbox, a personal file storage solution, to distribute their data files. The most cost-effective and reliable systems remain obscure to most average users. For example, bittorrent has been used to distribute datasets by only some computer science/bioinformatics research communities.

## Versioning

Many people do not realize the importance of versioning at all. Some overwrite files with new versions without considering the repercussions. Others fail to keep old versions available, only distributing the latest -- which is still damaging.

There are problems even in how versioning is implemented. While **version control systems** (VCS) have prolifierated in the software engineering world, most data files continue to be managed by ad-hoc and brittle filename **versioning schemes**. We have all seen the terrible ones (see the cartoon below).

![phd-comics-final](http://www.phdcomics.com/comics/archive/phd101212s.gif)

Better ones exist (like timestamping the filenames), but still fail to support useful VCS features like branching histories, version description messages, version merging, etc. Sure, the world would be better if everybody used git. But they will not. We need to bake VCS into existing workflows.

## Permanence

Sometimes published datasets are no longer available in their original location, so one must find them again. Sometimes, datasets disappear completely. [This paper](https://www.cell.com/current-biology/abstract/S0960-9822(13)01400-0) found that, in biology alone, "the odds of a data set being extant fall by 17%
per year."

This is absurd. The point of research is to gather and reason on data. We ought to be able to keep the data around, in _precisely_ the exact form it was originally published. No single dataset should _ever_ go missing. No single dataset _version_ should ever go missing either. Getting data published is hard enough. We cannot afford to then lose it.

We need a _permanent_ repository, where all data survives.

## Indexing

Datasets are strewn across the web. Generally, dataset authors need to arrange for the distribution and upkeep of the files, which means they setup whatever solution happens to be most convenient for them. This leads to distribution over a myriad different methods, with widely varying user experiences. And there is no global system to track published datasets, or their publication meta-data (date, authors, license, version, etc). Some aggregated collections exist, but they are often field-specific and wildy varying in quality, usability, or completeness. This all makes searching for datasets tedious at best, and often fruitless.

Imagine a world where every dataset published can be found in one single, persistent global index -- across fields. Imagine this index also tracks the version histories, publication meta-data, related datasets, people, figures, etc. Imagine all this information standardized and easily searchable. Imagine all URLs to this index are guaranteed not to change, and to support a programmable API.

## Formatting

Researchers often have to clean, reformat, filter, or otherwise modify the data files they wish to work with. This can consume significant time and effort. Sometimes programs have to be written. Sometimes modifications must be done manually -- an error prone waste of valuable time. Often these modifications are the same that others need. Often, re-publishing the dataset after format changes might save the community valuable time.

## Licensing

Often, it is unclear what license published datasets carry. People tend to distribute raw data files, neglecting to specify what end users can do with the files. Though this feels "open," it is unclear whether publishing a modified version of the data is allowed. This ambiguity, with potential legal implications, deters forking and re-publishing of data. Most would rather not risk getting in legal trouble.

Open Source code solves this problem with clear licenses and licensing guidelines. It is common practice to always include a license with open source code -- this should be the same for data. While the data licenses are not yet as sophisticated as source code licenses, there are already many licenses covering common use cases (see [opendatacommons.org](http://opendatacommons.org) and [_How to License Research Data_](http://www.dcc.ac.uk/resources/how-guides/license-research-data)). We simply need licensing to become common practice. Requiring (or defaulting to) licenses in data publishing repositories may nudge people in the right direction, reduce ambiguity, and foster data forking.



## Open Access

The Open Access discussion often focuses on journals and access to papers. But, open access data is just as critical to scientific progress. Others have discussed this problem much better than I can, so I will link you to them directly:

- [Open Data - An Introduction (OKFN)](http://okfn.org/opendata/)
- [Data Access for the Open Access Literature (PLOS)](http://www.plosbiology.org/article/info%3Adoi%2F10.1371%2Fjournal.pbio.1001797)
- [Declaration on Access to Research Data from Public Funding (OECD)](http://www.oecd.org/science/sci-tech/sciencetechnologyandinnovationforthe21stcenturymeetingoftheoecdcommitteeforscientificandtechnologicalpolicyatministeriallevel29-30january2004-finalcommunique.htm)
- [Open Data in Science](http://precedings.nature.com/documents/1526/version/1)
- [Big Data for Development: From Information to Knowledge Societies](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2205145)
- [The impact of open access on research and scholarship](http://crln.acrl.org/content/73/2/83.full)

The takeaway is data should be **open-source**, for **distribution** and **modification**. What is often left out of these discussions is the friction people experience when attempting to do either. From undergoing a lengthy peer-review process, to applying for accounts, to asking for modification permission for others' data... the hurdles are numerous, _even in **open access** repositories_. We need to complement **open access** with **easy access**, to both read and write, or download and publish.

Imagine a world where researchers can fork and re-publish fixed, cleaned, reformatted datasets as easily as programmers fork code.

Friends, the promised land is in sight.
