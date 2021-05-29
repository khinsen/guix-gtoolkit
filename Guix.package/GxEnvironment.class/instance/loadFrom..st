persistence
loadFrom: aFileReference
	| packageOutputCatalog |
	self assert: aFileReference isDirectory.
	directory := aFileReference.
	self channels: (GxChannelFileParser parseFile: self channelFile).
	packageOutputCatalog := channels packageOutputs.
	(GxManifestFileParser parseFile: self manifestFile)
		do: [ :each | self addPackageOutput: each ]