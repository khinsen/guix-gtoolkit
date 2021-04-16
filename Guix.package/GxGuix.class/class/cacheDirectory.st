persistence
cacheDirectory
	| directory |
	directory := FileLocator home / '.config' / 'guix-gtoolkit'.
	directory ensureCreateDirectory.
	^ directory