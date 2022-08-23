running
runScript: aString arguments: anArray
	| scriptFile process |
	scriptFile := GxTempFile new.
	scriptFile asFileReference writeStreamDo: [ :s |
		s << aString ].
	process := self
		command: 'python3'
		arguments: { scriptFile asString }, anArray.
	process runAndWait.
	scriptFile delete.
	^ process