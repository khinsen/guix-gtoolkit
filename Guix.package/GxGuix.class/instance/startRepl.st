REPL
startRepl
	| portString |
	replProcess ifNotNil: [ ^ self ].
	portString := replProcessPort asString.
	(self class activeGuixReplProcesses select: [ :each |
		portString = (each envVariables at: 'GxGuixPort') ])
		ifNotEmpty: [ :p | replProcess := p. ^ self ].
	replProcess := OSSUnixSubprocess new
		command: '/usr/bin/ssh';
		arguments: {
			'-L'. portString, ':guix:', portString.
			'guix'.
			'guix'. 'repl'. '-t'. 'machine'. '--listen=tcp:', portString };
		environmentAt: 'GxGuixPort' put: portString;
		terminateOnShutdown.
	replProcess run.
	5 seconds wait.
	self initializeRepl