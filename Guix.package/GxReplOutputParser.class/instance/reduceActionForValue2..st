generated-reduction actions
reduceActionForValue2: nodes
	^ Dictionary
		with: #ObjectID -> (nodes at: 2)
		with: #printString -> (nodes at: 3)