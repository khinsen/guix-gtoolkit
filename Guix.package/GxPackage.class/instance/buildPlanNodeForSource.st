inspecting
buildPlanNodeForSource
	^ Dictionary
		with: #label -> 'Source' asRopedText bold
		with: #items -> self source