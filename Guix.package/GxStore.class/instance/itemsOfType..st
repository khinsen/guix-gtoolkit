accessing
itemsOfType: aString
	| output |
	output := GxGuix executeCommand:
				{ 'gc' . ('--', aString) }.
	self assert: output second isEmpty.
	^ (Character lf split: output first)
		reject: #isEmpty