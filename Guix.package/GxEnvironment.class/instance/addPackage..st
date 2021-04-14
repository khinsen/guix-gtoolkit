adding
addPackage: aPackage
	(packages includes: aPackage) ifFalse: [
		packages add: aPackage.
		guix announce: (GxEnvironmentModified for: self) ].