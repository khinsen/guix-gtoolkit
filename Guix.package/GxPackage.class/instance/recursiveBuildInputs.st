accessing
recursiveBuildInputs
	^ recursiveBuildInputs ifNil: [
		recursiveBuildInputs := (self buildInputs select: #isPackage) asSet.
		recursiveBuildInputs copy do: [ :each |
			recursiveBuildInputs := recursiveBuildInputs union: each recursiveBuildInputs ].
		recursiveBuildInputs ]