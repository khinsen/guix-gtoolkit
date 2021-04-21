operating
lookup: aString
	^ packageOutputs detect: [ :each | each specification = aString ]