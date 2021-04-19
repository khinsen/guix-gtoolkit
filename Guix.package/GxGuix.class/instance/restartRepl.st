REPL
restartRepl
	replProcess ifNotNil: [ :p |
		p isRunning
			ifTrue: [ [ p terminate ] on: Error do: [] ] ].
	replProcess := nil.
	self startRepl