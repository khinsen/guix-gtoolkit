operating
executeCommand: anArray
	| result |
	result := nil.
	OSSUnixSubprocess new
		command: '/usr/bin/ssh';
		arguments: #('guix' 'guix'), anArray;
		redirectStdout;
		redirectStderr;
		runAndWaitOnExitDo: [ :process :outString :errorString |
			process isSuccess
				ifTrue: [ result := outString ]
				ifFalse: [ self error: process exitStatusInterpreter printString ] ].
	^ result