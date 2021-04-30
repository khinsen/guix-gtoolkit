packages
inputsForPackage: aString
	| inputs directInputs buildInputs process processPackageSpecification processors processPackageData processSource |
	inputs := self runReplCommandAndParse: '(inputs "', aString, '")'.
	processPackageSpecification := [ :input |
		channels packageCatalog lookup: input ].
	processPackageData := [ :input |
		GxPackage new guix: self; fromJson: input ].
	processSource := [ :input | input asUrl ].
	processors :=
		Dictionary
			with: #package -> processPackageSpecification
			with: #'package-data' -> processPackageData
			with: #source -> processSource.
	process := [ :input | (processors at: input first) value: input second ].
	directInputs := inputs first asSet collect: process.
	buildInputs := inputs second asSet collect: process.
	^ { directInputs. buildInputs }