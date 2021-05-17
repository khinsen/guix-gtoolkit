inspecting
buildPlanFor: view
	| nodes |
	nodes := {
				self buildPlanNodeForBuildSystem.
				self buildPlanNodeForSource.
				self buildPlanNodeForInputs.
				self buildPlanNodesForOutputs
			}.

	view nodes
		shape: [ :each |
			GtMondrianUMLClassElement withDefaultContainer
			label: (each at: #label) ];
		with: nodes
		forEach: [ :each |
			view nodes
				shape: [ :eachGxObject | eachGxObject asNodeElement ];
				with: (each at: #items).
			view layout vertical ].

	view edges
		shape: [ :x |
			| head border |
			border := BlBorder paint: Color gray width: 1.
			head := BlArrowheadSimpleArrow new
						border: border.
			BlLineElement new
				toHead: head;
				border: border ];
		connect: {
					(nodes at: 2) -> (nodes at: 1).
					(nodes at: 3) -> (nodes at: 1).
					(nodes at: 1) -> (nodes at: 4).
				}
		from: #key to: #value.

	view layout horizontalTree.
	^ view