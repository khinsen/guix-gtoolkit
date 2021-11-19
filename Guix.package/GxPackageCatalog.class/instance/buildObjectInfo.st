initialization
buildObjectInfo
	| scriptFile process |
	scriptFile := GxGuix cacheDirectory / (channels channelHash hex, '-packages.scm').
	scriptFile writeStreamDo: [ :s | s << self objectInfoScript ].
	process := guix newGuixProcessWithArguments:
				{ 'repl'. scriptFile fullName. self packageInfoFile fullName }.
	process status.
	scriptFile delete.
	process status isSuccess
		ifFalse: [ self error: process output stderr ]