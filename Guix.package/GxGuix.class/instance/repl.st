accessing
repl
	^ replProcess ifNil: [ replProcess := self startRepl ]