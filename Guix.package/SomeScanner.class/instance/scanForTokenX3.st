generated
scanForTokenX3
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX2 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $$ and: $&)
				or: [ (currentCharacter between: $* and: $/)
						or: [ currentCharacter == $:
								or: [ (currentCharacter between: $< and: $Z)
										or: [ (currentCharacter between: $^ and: $_)
												or: [ (currentCharacter between: $a and: $z)
														or: [ currentCharacter == $~ ] ] ] ] ] ] ])
		ifTrue:
			[ self scanForTokenX1 ].
	^ self reportLastMatch