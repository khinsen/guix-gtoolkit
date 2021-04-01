accessing
packageInfoFile
	| directory channelHash |
	directory := FileLocator home / '.config' / 'guix-gtoolkit'.
	directory ensureCreateDirectory.
	channelHash := (SHA256 hashMessage:
					(self channels values flatCollect: [ :each |
						{each name. each commit} ])
					printString) hex.
	^ directory / (channelHash, '.json')