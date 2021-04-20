cleanup
invalidate
	"Ensures that the instance will not be reused, and frees resources"
	channels := nil.
	packageCatalog := nil.
	replProcess ifNotNil: [ :p |
		p isRunning
			ifTrue: [ [ p terminate ] on: Error do: [] ] ].
	replProcess := nil.