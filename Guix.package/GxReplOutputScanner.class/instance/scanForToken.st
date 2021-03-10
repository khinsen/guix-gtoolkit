generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $#
		ifTrue:
			[ ^ self scanForTokenX5 ].
	currentCharacter == $(
		ifTrue:
			[ ^ self scanForTokenX4 ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter == $.
		ifTrue:
			[ ^ self scanForTokenX2 ].
	^ self scanForTokenX8