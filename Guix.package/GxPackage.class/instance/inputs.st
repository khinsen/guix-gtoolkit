accessing
inputs
	| inputs |
	^ inputs ifNil: [ inputs := guix inputsForPackage: self specification ]