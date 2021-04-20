REPL
initializeRepl
	| emptyLine |
	emptyLine := String with: Character lf with: Character lf.
	(emptyLine split: GxGuix new replCode) do: [ :each |
		self runReplCommand: each ]