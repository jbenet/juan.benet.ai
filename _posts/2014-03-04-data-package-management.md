---
layout: post
title:  Data Package Management
date:   2014-03-04 07:03:03 -08:00
categories: data
---

# WARNING: DRAFT

[Numerous problems plague data sharing today]({% post_url 2014-02-21-data-management-problems %}). This post proposes Package Management as the foundation to address them. Note: to make sure we're on the same page semantically, check my [data vocabulary]({% post_url 2014-02-21-data-management-vocabulary %}).

## Package Managers

> In software, a package management system, also called package manager, is a collection of software tools to automate the process of installing, upgrading, configuring, and removing software packages for a computer's operating system in a consistent manner. It typically maintains a database of software dependencies and version information to prevent software mismatches and missing prerequisites. <small class="align-right">From [Package Management System (Wikipedia)](http://en.wikipedia.org/wiki/Package_management_system).</small>

Package managers have been hailed among [the most important innovations](http://ianmurdock.com/solaris/how-package-management-changed-everything/) Linux brought to the computing industry. They greatly simplified and improved software distribution. By versioning, carefully bookkeeping, and maintaining centralized repositories, the various linux communities built robust and usable systems.

For end users, Package Managers automated software installation (adding, upgrading, and removing programs). Typical installation meant having to manually (1) find and download archives, (2) compile binaries (which often failed), (3) move files to their destination, and -- worst of all -- (4) repeat for all dependencies, and dependencies of dependencies. Package managers automated the process into one command: `pkgmgr install package-name`. Uninstalling software (reverting  installation, often undocumented) became similarly simple: `pkgmgr uninstall package-name`. Users no longer had to search the web for the compatible versions of programs, walk trees of dependencies, wrestle with compilers, and hope that everything interoperated just right. Instead, users could rely on common programs being versioned, listed, and properly packaged for their systems.

For software authors, Package Managers automated software distribution (packaging, hosting, and disseminating). Before, programmers would have to create bundles of their source code with (often complicated) installation instructions. Though conventions existed (include a `Makefile`, `README`, and `LICENSE`), installation and its documentation were confusing hurdles that harmed the adoption of programs. Additionally, authors had to find a reliable way to transfer the files to end users, which usually meant having to create and maintain a website. If the website failed, the package (and its dependents) would not be installable. Package managers host all files in a central repository and are mirrored for redundancy, which greatly increases the availability of packages and reduces the authors' time and money costs. While packaging across platforms varies from [simple](http://gist.io/1318304) to [complex](http://www.debian.org/doc/manuals/packaging-tutorial/packaging-tutorial.en.pdf), it is standardized and well worth it for software authors.

## Solving Data Problems

The activities of both publishers and users of datasets resemble those of authors and users of software packages. Moreover, the problems I presented in [_Data Management Problems_]({% post_url 2014-02-21-data-management-problems %}) are precisely the kind of problems package managers solved for software. Below I outline how package managers can also solve them for data; though each issue is large and worth addressing at length in the future. The takeaway is this:

> (1) A Package Manager can solve our Data Management problems.


### Distribution

Package Managers generally use centralized repositories to store and distribute their packages. Individual publishers simply upload their files to the repository, offloading the costs of distribution to the network's infrastructure. This greatly reduces publishing friction, as individuals no longer need to worry about setting up their own websites, paying for distribution themselves, or sourcing funding. It also _reduces overall costs_, by pooling network resources.

#### Amortizing Distribution Costs

Monetary costs are certainly still an issue, but an organization setup with the explicit goal of managing and distributing large datasets is better equipped to handle them than individual dataset authors. By pooling the resources and efforts of interested individuals (engineers, admins, etc), such an organization can better:

1. Attract and secure funding, such as grants or [crowdfunding](http://en.wikipedia.org/wiki/Crowdfunding).
1. Design and implement complex technical solutions to reduce costs.
1. Simplify the publishing process with tools addressing common pain points.

> (2) A Data Package Manager would amortize distribution costs.

### Indexing

Indexing is the raison d'etre of package managers. They are designed precisely to provide central access points where all packages can be found. By collecting domain-specific meta-data, package managers allow efficient and programmable search for packages. For example, in our dataset case, consider collecting dataset meta-data such as the (a) title, (b) research fields, (c) file formats, (d) abstract, (e) relevant keywords, (f) relevant publications, (g) license, (h) sources, (i) authors, and (j) publication date. A central index of this information would provide powerful and precise search of available datasets. It would also standardize the meta-data requirements, ensure publishers provide it, and allow users to view it.

> (3) A Data Package Manager would index and search datasets.

### Versioning

The need for versioning data is clear. Datasets change over time, often after being shared with others or published broadly. It is critical to track and provide access to these changes, or at least to the different published versions. Regardless of correctness or currency, _all_ versions must be kept available; future work will often seek to understand or compare previous work done with previous dataset versions. To stress the point, **for the sake of the scientific enterprise and data work in general, we must track and distribute all versions of datasets**.

> (4) A Data Package Manager would provide all versions of datasets.

#### Version Control Systems for Data

But how exactly to version data is a complex question. To date, there is no single Version Control System capable of handling datasets as well as [git][git] handles source code. Unlike code, which is plain text, datasets come in a tremendous variety of formats. Version efforts that assume datasets will follow certain properties (e.g. small size, plaintext format) are bound to be limited in scope. Perhaps this is acceptable, as format-specific VCSes can provide great domain-specific functionality. Or perhaps one VCS could be built to easily accomodate domain-specific extensions.[^1] This will be the subject of a future post. For now, let us separate concerns as three different but related needs:

1. Domain-specific data versioning techniques and tools.
2. Version Control Systems that leverage (1.) and track all separate versions.
3. Indexing services that (a) understand (2.) and provide access to the tracked versions, (b) but are agnostic to (1.).

Separating these needs out provides clear tool scope. Existing or new Version Control Systems can handle (2.), independent of tools built to handle (1.). A Package Manager can handle (3.).

While git has achieved tremendous success and is currently the most popular version control system, history has shown that preferences shift as better tools emerge (git replaced svn, svn replaced cvs, etc). Unless it becomes abundantly clear that no new VCS would supplant current ones, it would be wise to build Package Managers independent and compatible with various VCSes.

> (5) A Data Package Manager would be independent of VCS.

### Permanence

### Formatting

### Licensing

### Open Access

## Summary:

1. A Package Manager can solve our Data Management problems.
2. It would amortize distribution costs.
3. It would index and search datasets.
4. It would provide all versions of datasets.
5. It would be independent of VCS.

[^1]: Why [git](http://git-scm.com) is not it (yet) is argued in a future post.


<!-- The multiplicity of software package managers is, perhaps, an issue in itself. Thankfully, generally there is one canonical package maneger per use case. Still, arguments can be made for a "Package Manager of Package Managers", or "One Package Manager to Manage Them All". Here are some examples:

- Operating System Packages:
  [apt (debian)](https://packages.debian.org),
  [apt (ubuntu)](https://packages.ubuntu.com),
  [rpm (redhat)](http://www.rpm.org),
  [brew (osx)](http://brew.sh).
- Source Code:
  [GitHub](https://github.com/),
  [Bitbucket](https://bitbucket.org/),
  [LaunchPad](http://launchpad.net/),
  [SourceForge](http://sourceforge.net/),
  [Google Code](http://code.google.com/).
- Language/Platforms:
  [PyPI (Python)](https://pypi.python.org/‎),
  [RubyGems (Ruby)](http://rubygems.org/‎),
  [npm (node)](https://www.npmjs.org/),
  [Cabal (Haskell)](http://www.haskell.org/cabal).
- Text Editors:
  [Emacs](http://marmalade-repo.org/),
  [SublimeText](https://sublime.wbond.net/‎),
  [Atom](https://atom.io/packages).
- App Stores:
  Apple ([Mac](http://en.wikipedia.org/wiki/Apple_App_Store),
         [iOS](http://en.wikipedia.org/wiki/App_Store_(iOS)));
  Google ([Android](https://play.google.com/store/apps‎),
          [Chrome](https://chrome.google.com/webstore));
  Microsoft ([Desktop](windows.microsoft.com/en-us/windows-8/apps‎),
             [Phone](www.windowsphone.com/en-us/store‎)).
-->

---

[git]: http://git-scm.com/ "Git"
