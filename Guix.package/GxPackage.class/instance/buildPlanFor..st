inspecting
buildPlanFor: view
	| nodes levels |
	nodes := {
				self buildPlanNodeForSource.
				self buildPlanNodeForInputs.
				self buildPlanNodeForBuildSystem.
				self buildPlanNodesForOutputs
			}.
	levels := { {nodes first. nodes second}. {nodes third}. {nodes fourth} }.

	view nodes
		shape: [ :eachLevel |
			BlElement new constraintsDo: [ :c |
				c horizontal fitContent.
				c vertical fitContent ] ];
		with: levels;
		forEach: [ :eachLevel |
			view nodes
				shape: [ :eachNode |
					GtMondrianUMLClassElement withDefaultContainer
						label: (eachNode at: #label) ];
				with: eachLevel
				forEach: [ :eachNode |
					view nodes
						shape: [ :eachGxObject | eachGxObject asNodeElement ];
						with: (eachNode at: #items).
					view layout vertical ].
			view layout vertical
				cellSpacing: 20;
				alignTopRight ].

	view edges
	"Invisible edges, only for geting the right layout."
		shape: [ BlLineElement new ];
		connect: { levels first -> levels second. levels second -> levels third }
		from: #key to: #value.

	view edges
		shape: [ :x |
			BlSigmoidElement new
				border: (BlBorder paint: Color gray width: 1) ];
		fromRightCenter;
		toLeftCenter;
		connect: {
					(nodes at: 1) -> (nodes at: 3).
					(nodes at: 2) -> (nodes at: 3).
				}
		from: #key to: #value.
	"Use a straight line for the last connection because of a bug in
	BlSigmoidElement that makes the element invisible if it's straight."
	view edges
		shape: [ :x |
			BlLineElement new
				border: (BlBorder paint: Color gray width: 1) ];
		fromRightCenter;
		toLeftCenter;
		connect: {
					(nodes at: 3) -> (nodes at: 4).
				}
		from: #key to: #value.

	view layout horizontalTree
		levelDistance: 50.
	^ view