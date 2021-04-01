accessing
packageInfoFile
	| directory |
	directory := FileLocator home / '.config' / 'guix-gtoolkit'.
	directory ensureCreateDirectory.
	channels flatCollect: [ :each | each name, each commit ]