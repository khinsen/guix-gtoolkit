generated
scanForTokenX5
	currentCharacter isDigit
		ifTrue:
			[ ^ self scanForTokenX4 ].
	('+-' includes: currentCharacter)
		ifTrue:
			[ ^ self scanForTokenX1 ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue:
			[ ^ self scanForTokenX3 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $$ and: $&)
				or: [ ('*,' includes: currentCharacter)
						or: [ (currentCharacter between: $. and: $/)
								or: [ currentCharacter == $:
										or: [ (currentCharacter between: $< and: $Z)
												or: [ (currentCharacter between: $^ and: $_)
														or: [ (currentCharacter between: $a and: $z)
																or: [ currentCharacter == $~ ] ] ] ] ] ] ] ])
		ifTrue:
			[ self scanForTokenX2 ].
	^ self reportLastMatch