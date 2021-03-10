generated
scanForTokenX7
	[ self recordMatch: #(9).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch