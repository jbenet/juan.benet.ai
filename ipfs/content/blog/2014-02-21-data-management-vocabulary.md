---
layout: post
title:  Data Management Vocabulary
date:   2014-02-21 05:57:58 -08:00
categories: data
---

Last updated: 2014-02-28.

This is a vocabulary for the purpose of precisely defining propblems and solutions in my data management efforts. Many are standard [version control](#version-control) concepts.

<style>
h2 {
  border-top: 1px solid #eee;
  padding-top: 20px;
}
</style>

## bandwidth
for our purposes, capacity to distribute files across a network, mainly the internet.

## data
information stored in digital files

## dataset
a meaningful collection of related **data**, usually packaged as a set of files and identified with a name.


## Decoding

the process of converting _encoded information_ into _information_, according to a [format](#format). The inverse of [Encoding](#encoding).

For example, using `TMF` [defined below](#tmf-format):

```golang
func TMFDecode(s String) Devices {
  d := json.Decode(devs)
  if d.IsValid() {
    return d
  }
  throw TMFDecodingError(d)
}
```

## Distributed Version Control System (DVCS)
a **version control system** that operates in a distributed, decentralized fashion. Users do not need to interact with, or obtain permission from, a central authority for normal operation.

## Encoding

the process of converting _information_ into _encoded information_, according to a [format](#format). The inverse of [Decoding](#decoding).

For example, using `TMF` [defined below](#tmf-format):

```golang
func TMFEncode(d Devices) String {
  if d.IsValid() {
    return json.Encode(d)
  }
  throw TMFEncodingError(d)
}
```

## fork
a distinct project which originated by branching -- copying and subsequently modifying -- another. If project B was built by copying and modifying project A, project B is said to be a _fork_ of project A. Forks are often created to fix bugs, alter or add functionality, or take over maintenance.

## forking
copying the files from one project and modifying them to create another, distinct project. The new project is said to be a [fork](#fork) of the original.

## forking friction
infrastructural or cultural resistance to [forking](#forking) projects.

In software, developers used to be reluctant to forking because it carried the connotation of an organizational split or schism, and the weight of organizational maintenance. Github greatly reduced _forking friction_ in software by:

- terming original projects _forks_ as well (as opposed to only their off-shoots)
- making forking a common part of contributing to projects
- namespacing projects under usernames (e.g. `userA/project` could be a fork of `userB/project`)
- effectively combining all open-source communities under one network

In data management, users are often reluctant to forking a dataset because:

- they do not know whether they are able to (unclear or no licensing)
- they do not wish to cause an organizational split or schism
- they face [publishing friction](#publishing-friction)

## Format

"the way in which something is arranged"; a specification for how to `encode` and `decode` a message.

For example, consider the following [schema-laden](#schema-laden) format spec:

<div id="tmf-format"></div>

> Temperature Measurement Format (TMF)
>
> - TMF extends, or is on top of, JSON.
> - A `TMFFile` has a `.json` extension, and contains `TMFData`
> - A `TMFData` is a sequence of `TMFDevice` objects.
> - A `TMFDevice` object _must_ have two keys:
>   - `name`, mapped to a string.
>   - `temps`, mapped to a `TMFReadings` object.
> - A `TMFReadings` object maps `ISO Date` to a `TMFTemp`
> - A `TMFTemp` is a string with a `float` followed by one scale letter (`C`, `F`, or `K`).
>
> ```json
[
  {
    "name": "device0",
    "temps": {
      "2014-03-07 05:10:01": "292.0K",
      "2014-03-07 05:10:02": "291.7K",
      "2014-03-07 05:10:03": "5000.0K",
      "2014-03-07 05:10:04": "291.3K"
    }
  },
]
```

## Format Compatibility

a directed measure of whether a [format](#format) is able to represent the same [schemas](#schema) as another. For example, [JSON](http://json.org) and [XML](http://en.wikipedia.org/wiki/XML) are formats perfectly compatible with each other: all schemas represented in JSON can be represented in XML and viceversa. However, [GeoJSON](http://geojson.org) **is** compatible with XML (it follows from JSON being compatible with XML), but XML **is not** compatible with GeoJSON (not all XML files can be transformed into valid GeoJSON).

The idea of format-compatibility is useful to better understand how format conversion relationships work.

## git
a popular [distributed version control system](#distributed-version-control-system-(dvcs)). See <http://git-scm.com>.

## publishing friction
individual resistance to [publishing](#publishing) projects due to costs or perceived costs in doing so. For example, costs include:

- monetary costs for reliable distribution.
- obligation to maintain a published project indefinitely.
- loss of reputation if the project is deemed unsatisfactory.

_Publishing friction_ prevents the publishing of valuable projects. Building tools which decrease it boost the possibilities of progress.

## Schema

the structure, or specification of how information represents meaning.

For example:

- `Timestamp` specifies the time at which a measurement was taken.
- `Temperature` specifies the temperature measured.
- `TempMeasurements` specifies a sequence relating a `Timestamp` with a `Temperature`
- `Device` specifies a particular machine, with a `Name` and `TempMeasurements`

## Schema-Format Compatibility

a measure of whether a particular [format](#format) is able to represent a particular [schema](#schema).

## Schema-laden Format

a [format](#format) designed to represent a particular [schema](#schema). _Schema-less_ or universal formats, such as [JSON](http://json.org), can represent any schema. _Schema-laden_ formats, such as [GeoJSON](http://geojson.org), are tuned to represent a particular set of schemas. Schema-laden formats tend to implement schema specifications on top of a general format.

## Schema Compatibility

a measure of whether a particular [schema](#schema) is able to express another. It is useful to consider whether or not data can be transformed from one schema to another.

## storage
for our purposes, digital storage of files in computers.

## Universal Format
For our purposes, a format capable of storing any schema. Examples: JSON, XML. Contrast to GeoJSON, a format specific to a set of schemas, or a [_schema-laden_ format](#schema-laden-format).

## Version
a snapshot of files at a particular point in time. Versions are useful to trace histories of changes.

## Versioning
storing multiple versions of a given file to enable tracing the history of changes.

## Versioning Scheme
a scheme or protocol to identify different **versions** of file.

## Version Control
techniques to store, manage, and retrieve numerous digital files, using versioning.

## Version Control System (VCS)
a system (usually a software tool) used to enact, support, and simplify a particular form of **version control**.
