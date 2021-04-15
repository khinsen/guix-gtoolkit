adding
addPackageOutput: aPackageOutput
	(packageOutputs includes: aPackageOutput) ifFalse: [
		packageOutputs add: aPackageOutput.
		guix announce: (GxEnvironmentModified for: self) ].