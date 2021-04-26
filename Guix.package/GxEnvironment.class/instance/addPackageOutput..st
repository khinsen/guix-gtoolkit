adding
addPackageOutput: aPackageOutputOrString
	| aPackageOutput |
	(aPackageOutputOrString isKindOf: String)
		ifTrue: [ aPackageOutput := (channels packageCatalog resolveSpecification: aPackageOutputOrString) asPackageOutput ]
		ifFalse: [ aPackageOutput := aPackageOutputOrString ].
	(packageOutputs includes: aPackageOutput) ifFalse: [
		packageOutputs add: aPackageOutput shortestSpecification -> aPackageOutput.
		self guix announce: (GxEnvironmentModifiedEvent for: self).
		self saveManifest ].