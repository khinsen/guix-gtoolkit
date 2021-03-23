operating
executeCommand: anArray
	| tempFileReference output process |
	tempFileReference := FileLocator temp / 'guix_command_stdout.txt'.
	self assert: tempFileReference exists not.
	process := OSSUnixSubprocess new
		command: self class guixCommand;
		arguments: anArray;
		"Setting one dummy environment variable in order to get rid
		of the default ones."
		environmentAt: 'GxGuix' put: 'true';
		redirectStdoutTo: (StandardFileStream newFileNamed:  tempFileReference fullName);
		runAndWait.
	output := tempFileReference contents.
	tempFileReference delete.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ].
	^ output