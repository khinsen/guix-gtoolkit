accessing
executeCommand: anArray
	"Note: this works only for short outputs, see documentation of OSSUnixSubprocess"
	| output process |
	process := self newGuixProcessWithArguments: anArray.
	process
		redirectStdout;
		runAndWaitOnExitDo: [ :aProcess :stdout  |
			aProcess isSuccess
			ifFalse: [ self error: process exitStatusInterpreter printString ].
		output := stdout ].
	^ output