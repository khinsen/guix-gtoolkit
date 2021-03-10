generated
scanForTokenX8
	currentCharacter == $0
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX7 ].
	('+-' includes: currentCharacter)
		ifTrue:
			[ ^ self scanForTokenX1 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX6 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $$ and: $&)
				or: [ ('*,/:' includes: currentCharacter)
						or: [ (currentCharacter between: $< and: $Z)
								or: [ (currentCharacter between: $^ and: $_)
										or: [ (currentCharacter between: $a and: $z)
												or: [ currentCharacter == $~ ] ] ] ] ] ])
		ifTrue:
			[ self scanForTokenX3 ].
	^ self reportLastMatch