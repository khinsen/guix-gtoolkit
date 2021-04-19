initialization
buildPackageInfo
	| scriptFile process |
	scriptFile := GxGuix cacheDirectory / (channels channelHash hex, '-packages.scm').
	scriptFile writeStreamDo: [ :s | s << self packageInfoScript ].
	process := guix newGuixProcessWithArguments:
				{ 'repl'. scriptFile fullName. self packageInfoFile fullName }.
	process runAndWait.
	scriptFile delete.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ]