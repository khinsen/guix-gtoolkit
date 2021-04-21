accessing
loadFrom: aFileReference
	self assert: aFileReference isDirectory.
	directory := aFileReference.
	self name: directory basename.
	self channels: (GxChannelFileParser parse: directory / 'channels.scm'). 