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

You can combine channels by concatenation:
```smalltalk
guix := GxGuixChannel latest.
guixPast := GxChannel name: 'guix-past' url: 'https://gitlab.inria.fr/guix-hpc/guix-past' commit: '0f892e4f9c37c385ecde66547d5c56d096b7109c'.
twoChannels := guix, guixPast
```

## Exploring packages

Starting from a set of channels, you can obtain a package catalog with many browsing features:
```smalltalk
GxChannels current packageCatalog
```

The looking-glass icon gives access to a powerful search engine, don't miss it!

![package-catalog](https://user-images.githubusercontent.com/94934/116088801-7dc66980-a6a2-11eb-8775-44f7a41aaf06.png)

## Environments

A computational environment defines the resources that a computation has access to. These resources include in particular software packages, but also the network, parts of the file system, environment variables, etc. Guix provides very detailed control over the resources that are accessible in the environment (see [the manual](https://guix.gnu.org/en/manual/en/html_node/Invoking-guix-environment.html)), but the command-line interface is rather messy and oriented towards the needs of software developers rather than towards facilitating reproducible computation.

For now, the only type of Guix environment supported corresponds to `guix environment --pure`, with all environment variables cleared. Support for container environments will be added later. Non-pure environments, however, will not be supported, because they are not reproducible.

Environments can be ephemeral or persistent. Ephemeral environments are typically constructed on the fly for running a specific program. Example:
```smalltalk
env := GxChannels current newEnvironment
	addPackageOutput: 'python';
	addPackageOutput: 'python-numpy';
	yourself.
(env command: 'python3' arguments: #('-c' 'import numpy; print(numpy.__version__)'))
	runAndWait;
	stdout
```
This creates an empty environment based on the current state of the user's default channels and adds two packages. Next, a command is run in that environment, returning its standard output. The `command:argument:` method is a convenience function that has some limitations. It is useful mainly for short runs returning small enough output to collect in memory. In the spirit of a convenience function, it passes a few frequently needed environment variables (such as `HOME` or `DISPLAY`) into the new environment. For more control over processes run in a `GxEnvironment`, use
```smalltalk
env newSubprocess
```
which creates an instance of `OSSUnixSubprocess` (see the [OSSubprocess](https://github.com/pharo-contributions/OSSubprocess) package) whose behavior is only slightly  modified:
 1. The subprocess does not inherit any environment variables.
 2. The command/arguments combination is modified to include the required invocation of Guix.


