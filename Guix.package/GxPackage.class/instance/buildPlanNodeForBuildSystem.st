inspecting
buildPlanNodeForBuildSystem
	| label |
	label := 'Build system ' asRopedText, buildSystem name asRopedText italic.
	^ Dictionary
		with: #label -> label bold
		with: #items -> (self indirectInputs asOrderedCollection
								sorted: [ :a :b | a displayString <= b displayString ]).