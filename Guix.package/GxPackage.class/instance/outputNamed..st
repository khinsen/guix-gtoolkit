operating
outputNamed: aSymbol
	^ outputs detect: [ :each | each output = aSymbol ]