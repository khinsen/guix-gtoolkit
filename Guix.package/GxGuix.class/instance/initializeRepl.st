REPL
initializeRepl
	| emptyLine |
	"Without this command, store path lookup can fail because (getcwd) fails."
	self runReplCommand: '(chdir "', FileLocator home fullName , '")'.
	emptyLine := String with: Character lf with: Character lf.
	(emptyLine split: GxGuix new replCode) do: [ :each |
		self runReplCommand: each ]