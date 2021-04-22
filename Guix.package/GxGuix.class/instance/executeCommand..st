operating
executeCommand: anArray
	| tempFileReference output process |
	tempFileReference := FileLocator temp / 'guix_command_stdout.txt'.
	self assert: tempFileReference exists not.
	process := self class newGuixProcessWithArguments: anArray.
	process
		redirectStdoutTo: (StandardFileStream newFileNamed:  tempFileReference fullName);
		runAndWait.
	output := tempFileReference contents.
	tempFileReference delete.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ].
	^ output