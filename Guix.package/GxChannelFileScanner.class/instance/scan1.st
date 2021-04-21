generated
scan1
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(11) ].
	currentCharacter == $\
		ifTrue: [ self step.
			^ self scan1 ].
	true ] whileTrue