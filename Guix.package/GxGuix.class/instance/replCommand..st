REPL
replCommand: aString
	| stream result localhost |
	localhost := SocketAddress fromDottedString: '127.0.0.1'.
	stream := SocketStream openConnectionToHost: localhost port: replProcessPort timeout: 120000.
	result := stream upTo: Character lf.
	self assert: result equals: '(repl-version 0 1 1)'.
	stream nextPutAll: aString; cr; flush.
	result := stream upTo: Character lf.
	stream close.
	^ GxReplOutputParser parse: result.	