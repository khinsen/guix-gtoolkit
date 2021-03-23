testing
outIsInStore
	self storePaths at: #out
		ifPresent: [ :path |
			^ path asFileReference isDirectory ]
		ifAbsent: [ ^ false ].