*Guix
gxSplitAtDigitSequences
	| digits tokens keyStart keyStop |
	digits := '0123456789'.
	tokens := OrderedCollection new.
	keyStop := 1.
	[keyStop <= self size] whileTrue:
		[keyStart := self skipDelimiters: digits startingAt: keyStop.
		keyStop < keyStart
			ifTrue: [tokens add: (GxVersionNumberElement digits: (self copyFrom: keyStop to: (keyStart - 1))) ].
		keyStop := self findDelimiters: digits startingAt: keyStart.
		keyStart < keyStop
			ifTrue: [tokens add: (self copyFrom: keyStart to: (keyStop - 1))]].
	^tokens