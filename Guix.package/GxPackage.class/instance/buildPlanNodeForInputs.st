inspecting
buildPlanNodeForInputs
	^ Dictionary
		with: #label -> 'Inputs' asRopedText bold
		with: #items -> (self directInputs asOrderedCollection
								sorted: [ :a :b | a displayString <= b displayString ]).