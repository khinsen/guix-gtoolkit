adding
addPackageOutput: aPackageOutput
	(packageOutputs includes: aPackageOutput) ifFalse: [
		packageOutputs add: aPackageOutput.
		self guix announce: (GxEnvironmentModifiedEvent for: self).
		self saveManifest ].