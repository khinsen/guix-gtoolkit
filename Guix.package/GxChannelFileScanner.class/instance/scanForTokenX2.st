generated
scanForTokenX2
	[ self recordMatch: #(6).
	self step.
	currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ] ] whileTrue.
	^ self reportLastMatch