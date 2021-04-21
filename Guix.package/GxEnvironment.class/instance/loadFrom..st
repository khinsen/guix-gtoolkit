persistence
loadFrom: aFileReference
	| packageOutputCatalog |
	self assert: aFileReference isDirectory.
	directory := aFileReference.
	self name: directory basename.
	self channels: (GxChannelFileParser parseFile: directory / 'channels.scm').
	packageOutputCatalog := channels packageOutputs.
	(GxManifestFileParser parseFile: directory / 'manifest.scm') do: [ :each |
		self addPackageOutput: (packageOutputCatalog lookup: each) ]