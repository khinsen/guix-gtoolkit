*Guix
gxIndexForLine: anInteger
	| lineCounter |
	lineCounter := anInteger.
	1 to: self size do: [ :i |
		(self at: i) = Character lf ifTrue: [
			lineCounter := lineCounter - 1.
			lineCounter = 0 ifTrue: [ ^ i + 1 ] ] ].
	^ self size