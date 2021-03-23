operating
buildPackage: aPackage
	self executeCommand: { 'build'. aPackage specification }.
	self class announcer announce: (GxPackageBuilt for: aPackage)