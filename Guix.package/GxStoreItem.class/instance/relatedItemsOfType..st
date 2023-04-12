accessing
relatedItemsOfType: aString
	| output |
	output := GxGuix executeCommand:
				{ 'gc' . ('--', aString) . file fullName }.
	self assert: output second isEmpty.
	^ (Character lf split: output first)
		reject: #isEmpty
		thenCollect: [ :each | GxStoreItem file: each ]