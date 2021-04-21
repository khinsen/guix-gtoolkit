adding
addPackageOutput: aPackageOutput
	(packageOutputs includes: aPackageOutput) ifFalse: [
		packageOutputs add: aPackageOutput.
		self guix announce: (GxEnvironmentModified for: self).
		self saveManifest ].