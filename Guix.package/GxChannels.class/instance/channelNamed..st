accessing
channelNamed: aSymbol
	channels do: [ :each | each name = aSymbol ifTrue: [ ^ each ] ].
	^ nil