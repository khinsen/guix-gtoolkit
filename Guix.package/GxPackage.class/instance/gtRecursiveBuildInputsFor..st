inspecting
gtRecursiveBuildInputsFor: aView
	<gtView>
	dependents ifEmpty: [ ^ aView empty ].
	^ aView list
		title: 'Recursive Inputs';
		priority: 2;
		items: [ self recursiveBuildInputs asOrderedCollection
					sorted: [ :a :b | a displayString <= b displayString ] ];
		yourself.