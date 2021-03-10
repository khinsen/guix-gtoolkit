generated
scanForTokenX4
	self recordMatch: #(2).
	self step.
	currentCharacter == $n
		ifTrue: [ (self scanForString: 'on-self-quoting')
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			^ self reportLastMatch ].
	currentCharacter == $v
		ifTrue: [ (self scanForString: 'alue')
				ifTrue: [ self recordMatch: #(4).
					self step.
					currentCharacter == $s
						ifTrue: [ ^ self recordAndReportMatch: #(5) ] ] ].
	^ self reportLastMatch