generated
scanForToken
	self step.
	currentCharacter == $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter == $'
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter == $)
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter == $s
		ifTrue: [ (self scanForString: 'pecifications->manifest')
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			^ self reportLastMatch ].
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(2).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ] ] whileTrue ].
	^ self reportLastMatch