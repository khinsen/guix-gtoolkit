operating
path
	| p |
	p := (Character lf split: searchPaths)
			detect: [ :each | each beginsWith: 'export PATH=' ].
	self assert: [ p endsWith: '/bin"' ].
	^ (p copyFrom: 14 to: p size - 5) asFileReference