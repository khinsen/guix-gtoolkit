initialization
buildPackageInfo
	| scriptFile process |
	scriptFile := GxGuix cacheDirectory.
	scriptFile writeStreamDo: [ :s | s << self packageInfoScript ].
	process := self newGuixProcessWithArguments:
				{ 'repl'. scriptFile fullName. self packageInfoFile fullName }.
	process runAndWait.
	scriptFile delete.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ]