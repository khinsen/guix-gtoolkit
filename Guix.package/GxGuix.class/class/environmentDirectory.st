persistence
environmentDirectory
	| directory |
	directory := self configDirectory / 'environments'.
	directory ensureCreateDirectory.
	^ directory