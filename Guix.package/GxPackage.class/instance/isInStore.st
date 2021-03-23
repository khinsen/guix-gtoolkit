testing
isInStore
	self storePaths do: [ :each |
		each asFileReference isDirectory ifFalse: [ ^ false ] ].
	^ true