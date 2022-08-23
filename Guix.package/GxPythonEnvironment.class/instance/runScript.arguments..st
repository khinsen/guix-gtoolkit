running
runScript: aString arguments: anArray
	| scriptFile output |
	scriptFile := GxTempFile new.
	scriptFile asFileReference writeStreamDo: [ :s |
		s << aString ].
	output := (self
		command: 'python3'
		arguments: { scriptFile asString }, anArray)
		runAndWait;
		stdout.
	scriptFile delete.
	^ output