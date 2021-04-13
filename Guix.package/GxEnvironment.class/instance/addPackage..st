adding
addPackage: aPackage
	(packages includes: aPackage) ifFalse: [
		packages add: aPackage.
		"GxGuix announcer announce: (GxEnvironmentModified for: self)" ].