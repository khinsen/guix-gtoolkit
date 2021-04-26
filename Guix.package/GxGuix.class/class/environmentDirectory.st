persistence
environmentDirectory
	| directory |
	directory := FileLocator home / '.config' / 'guix-environments'.
	directory ensureCreateDirectory.
	^ directory