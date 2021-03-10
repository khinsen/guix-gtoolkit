generated
scanForTokenX5
	self step.
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	('ft' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	^ self reportLastMatch