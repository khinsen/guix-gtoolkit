operating
outputNamed: aSymbol
	^ outputs
		detect: [ :each | each output = aSymbol ]
		ifNone: [ self error: 'Package ', name, ' has no output ', aSymbol ]