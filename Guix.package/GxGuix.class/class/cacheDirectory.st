persistence
cacheDirectory
	| directory |
	directory := FileLocator home / '.cache' / 'guix-gtoolkit'.
	directory ensureCreateDirectory.
	^ directory