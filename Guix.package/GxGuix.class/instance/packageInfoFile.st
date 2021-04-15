channels
packageInfoFile
	| directory |
	directory := FileLocator home / '.config' / 'guix-gtoolkit'.
	directory ensureCreateDirectory.
	^ directory / (self channelHash hex, '.json')