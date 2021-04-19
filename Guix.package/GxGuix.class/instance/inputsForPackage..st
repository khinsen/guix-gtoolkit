accessing
inputsForPackage: aString
	| inputs directInputs buildInputs process |
	inputs := self runReplCommandAndParse: '(inputs "', aString, '")'.
	process := [ :input |
		input first = #package
			ifTrue: [ channels packageCatalog lookup: input second ]
			ifFalse: [ input first = #source
						ifTrue: [ input second asUrl ]
						ifFalse: [ input second ] ] ].
	directInputs := inputs first collect: process.
	buildInputs := inputs second collect: process.
	^ { directInputs. buildInputs }