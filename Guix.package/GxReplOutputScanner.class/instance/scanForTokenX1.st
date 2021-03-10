generated
scanForTokenX1
	self recordMatch: #(11).
	self step.
	currentCharacter == $0
		ifTrue: [ self recordMatch: #(9 11).
			self step.
			(currentCharacter == $!
				or: [ (currentCharacter between: $$ and: $&)
						or: [ (currentCharacter between: $* and: $:)
								or: [ (currentCharacter between: $< and: $Z)
										or: [ (currentCharacter between: $^ and: $_)
												or: [ (currentCharacter between: $a and: $z)
														or: [ currentCharacter == $~ ] ] ] ] ] ])
				ifTrue: [ [ self recordMatch: #(11).
					self step.
					currentCharacter == $!
						or: [ (currentCharacter between: $$ and: $&)
								or: [ (currentCharacter between: $* and: $:)
										or: [ (currentCharacter between: $< and: $Z)
												or: [ (currentCharacter between: $^ and: $_)
														or: [ (currentCharacter between: $a and: $z)
																or: [ currentCharacter == $~ ] ] ] ] ] ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(9 11).
			self step.
			currentCharacter isDigit ] whileTrue ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $$ and: $&)
				or: [ (currentCharacter between: $* and: $/)
						or: [ currentCharacter == $:
								or: [ (currentCharacter between: $< and: $Z)
										or: [ (currentCharacter between: $^ and: $_)
												or: [ (currentCharacter between: $a and: $z)
														or: [ currentCharacter == $~ ] ] ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(11).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $$ and: $&)
						or: [ (currentCharacter between: $* and: $:)
								or: [ (currentCharacter between: $< and: $Z)
										or: [ (currentCharacter between: $^ and: $_)
												or: [ (currentCharacter between: $a and: $z)
														or: [ currentCharacter == $~ ] ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch