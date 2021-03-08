accessing
replCommand: aString
	| stream result |
	stream := SocketStream openConnectionToHostNamed: 'localhost' port: 37148.
	result := stream upTo: Character lf.
	self assert: result equals: '(repl-version 0 1 1)'.
	stream nextPutAll: aString; cr; flush.
	result := stream upTo: Character lf.
	stream close.
	^ result.	