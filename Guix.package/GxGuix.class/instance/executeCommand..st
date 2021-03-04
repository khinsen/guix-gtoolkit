operating
executeCommand: anArray
	| tempFileReference output |
	tempFileReference := FileLocator temp / 'guix_command_stdout.txt'.
	self assert: tempFileReference exists not.
	OSSUnixSubprocess new
		command: '/usr/bin/ssh';
		arguments: #('guix' 'guix'), anArray;
		redirectStdoutTo: (StandardFileStream newFileNamed:  tempFileReference fullName);
		redirectStderr;
		runAndWaitOnExitDo: [ :process |
			process isSuccess
				ifFalse: [ self error: process exitStatusInterpreter printString ] ].
	output := tempFileReference contents.
	tempFileReference delete.
	^ output