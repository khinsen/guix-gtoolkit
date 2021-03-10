generated
scanForTokenX3
	[ self recordMatch: #(11).
	self step.
	currentCharacter == $!
		or: [ (currentCharacter between: $$ and: $&)
				or: [ (currentCharacter between: $* and: $:)
						or: [ (currentCharacter between: $< and: $Z)
								or: [ (currentCharacter between: $^ and: $_)
										or: [ (currentCharacter between: $a and: $z)
												or: [ currentCharacter == $~ ] ] ] ] ] ] ] whileTrue