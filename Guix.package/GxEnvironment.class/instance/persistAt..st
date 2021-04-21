persistence
persistAt: aFileReference
	self assert: aFileReference exists not.
	aFileReference ensureCreateDirectory.
	directory := aFileReference.
	self saveChannels.
	self saveManifest