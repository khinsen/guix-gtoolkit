persistence
loadFrom: aFileReference
	| packageOutputCatalog |
	self assert: aFileReference isDirectory.
	directory := aFileReference.
	self name: directory basename.
	self channels: (GxChannelFileParser parseFile: self channelFile).
	packageOutputCatalog := channels packageOutputs.
	(GxManifestFileParser parseFile: self manifestFile)
		do: [ :each | self addPackageOutput: (packageOutputCatalog lookup: each) ]