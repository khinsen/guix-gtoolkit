# A plugin for [Glamorous Toolkit](https://gtoolkit.com/download/) for reproducible computations with Guix

## Installation

On a Linux system with the [Guix](https://guix.gnu.org/) package manager:

1. Download the [Glamorous Toolkit](https://gtoolkit.com/download/).
2. Launch Glamorous Toolkit and open a Playground.
3. Paste the following lines into the playground and run them
```
Metacello new
    baseline: 'Guix';
    repository: 'github://khinsen/guix-gtoolkit:main/';
    load.
```

Note: Until Glamorous Toolkit is packaged for Guix, you will
have to use Guix hosted on a different Linux distribution because
the precompiled binaries for Glamorous Toolkit won't work on
a pure Guix System. I am using Ubuntu for development.

## Functionality

The goal of this project is to support
 - the exploration of packages and environments, for the sake of transparency
 - the management of reproducible computational environments

Guix features that are currently (and perhaps forever) unsupported include
 - profiles
 - modifications to package definitions
 - package development

## Channels

A collection of packages in Guix is defined by a set of [channels](https://guix.gnu.org/en/manual/en/html_node/Channels.html#Channels), a channel being a Git repository containing package definitions. Guix manages a set of default channels for each user, which you can see by typing `guix describe` in a terminal, and which you can update using `guix pull`. In Pharo code, this set of default channels is accessed as
```smalltalk
GxChannels current
```

Alternatively, you can define channels explicitly in terms of (1) a name, (2) the URL of a Git repository and (3) the commit to be used:
```smalltalk
GxChannel 
	name: 'guix-past'
	url: 'https://gitlab.inria.fr/guix-hpc/guix-past'
	commit: '0f892e4f9c37c385ecde66547d5c56d096b7109c'
```

The most important channel is the standard Guix channel, which can be accessed with a shorthand that requires only the commit:
```smalltalk
GxGuixChannel commit: '5bc5371b347681c13a41fa8d9ed5fbf64354480a'
```

Finally, you can access the more recent commit in the Guix channel via
```smalltalk
GxGuixChannel latest
```
Watch out though: the latest commit typically changes several times a day!
