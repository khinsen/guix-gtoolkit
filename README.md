# A GUI for Guix emphasizing reproducible computations

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
