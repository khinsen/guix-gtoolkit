REPL
startRepl
	| portString |
	replProcess ifNotNil: [ ^ self ].
	portString := self replProcessPort asString.
	(self class activeReplProcesses select: [ :each |
		portString = (each envVariables at: 'GxGuixPort') ])
		ifNotEmpty: [ :p | replProcess := p. ^ self ].
	replProcess :=
		self newGuixProcessWithArguments:
			{ 'repl'. '-t'. 'machine'. '--listen=tcp:', portString }.
	replProcess
		environmentAt: 'GxGuixPort' put: portString;
		terminateOnShutdown;
		run.
	5 seconds wait.
	self initializeRepl