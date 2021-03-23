accessing
storePaths
	^ storePaths ifNil: [ storePaths := self guix storePathsForPackage: self specification ]