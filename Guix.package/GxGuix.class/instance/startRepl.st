REPL
startRepl
	| portString |
	replProcess ifNotNil: [ ^ self ].
	portString := replProcessPort asString.
	(self class activeReplProcesses select: [ :each |
		portString = (each envVariables at: 'GxGuixPort') ])
		ifNotEmpty: [ :p | replProcess := p. ^ self ].
	replProcess := OSSUnixSubprocess new
		command: self class guixCommand;
		arguments: { 'repl'. '-t'. 'machine'. '--listen=tcp:', portString };
		environmentAt: 'GxGuixPort' put: portString;
		terminateOnShutdown.
	replProcess run.
	2 seconds wait