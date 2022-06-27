REPL
startRepl
	| portString |
	replProcess ifNotNil: [ ^ self ].
	portString := self replProcessPort asString.
	(self class activeReplProcesses select: [ :each |
		portString = (each envVariables at: 'GxGuixPort') ])
		ifNotEmpty: [ :p | replProcess := p first. ^ self ].
	replProcessBuilder :=
		self newGuixProcessWithArguments:
			{ 'repl'. '-t'. 'machine'. '--listen=tcp:', portString }.
	replProcess := replProcessBuilder
		env: 'GxGuixPort' value: portString;
		pipeStdout;
		spawn.
	5 seconds wait.
	self initializeRepl