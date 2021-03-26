REPL
restartRepl
	replProcess isRunning
		ifTrue: [ [ replProcess terminate ] on: Error do: [] ].
	replProcess := nil.
	self startRepl