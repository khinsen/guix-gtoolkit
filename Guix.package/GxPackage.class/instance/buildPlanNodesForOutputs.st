inspecting
buildPlanNodesForOutputs
	^ Dictionary
		with: #label -> 'Outputs' asRopedText bold
		with: #items -> self outputs.