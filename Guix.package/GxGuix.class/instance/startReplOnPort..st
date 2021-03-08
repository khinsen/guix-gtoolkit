operating
startReplOnPort: anInteger
	| portString |
	replProcess ifNotNil: [ ^ self ].
	portString := anInteger asString.
	replProcess := OSSUnixSubprocess new
		command: '/usr/bin/ssh';
		arguments: {
			'-L'. portString, ':guix:', portString.
			'guix'.
			'guix'. 'repl'. '-t'. 'machine'. '--listen=tcp:', portString };
		terminateOnShutdown.
	[ replProcess run ] fork.