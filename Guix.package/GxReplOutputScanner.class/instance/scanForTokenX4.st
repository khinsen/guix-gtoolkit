generated
scanForTokenX4
	[ self recordMatch: #(4).
	self step.
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch