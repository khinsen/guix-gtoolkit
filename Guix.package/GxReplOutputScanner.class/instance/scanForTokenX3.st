generated
scanForTokenX3
	[ self recordMatch: #(3).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch