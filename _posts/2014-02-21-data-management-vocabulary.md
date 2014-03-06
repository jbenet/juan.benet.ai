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

## Distributed Version Control System (DVCS)
a **version control system** that operates in a distributed, decentralized fashion. Users do not need to interact with, or obtain permission from, a central authority for normal operation.

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

## git
a popular [distributed version control system](#distributed-version-control-system-(dvcs)). See <http://git-scm.com>.

## publishing friction
individual resistance to [publishing](#publishing) projects due to costs or perceived costs in doing so. For example, costs include:

- monetary costs for reliable distribution.
- obligation to maintain a published project indefinitely.
- loss of reputation if the project is deemed unsatisfactory.

_Publishing friction_ prevents the publishing of valuable projects. Building tools which decrease it boost the possibilities of progress.

## storage
for our purposes, digital storage of files in computers.

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
