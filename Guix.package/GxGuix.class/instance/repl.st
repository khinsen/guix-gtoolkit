accessing
repl
	^ replProcess ifNil: [ self startRepl. replProcess ]