printing
displayString
	| label |
	label := data at: #filename.
	label = false ifTrue: [ label := data at: #url ].
	^ label