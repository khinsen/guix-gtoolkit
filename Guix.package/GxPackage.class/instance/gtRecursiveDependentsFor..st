inspecting
gtRecursiveDependentsFor: aView
	<gtView>
	dependents ifEmpty: [ ^ aView empty ].
	^ aView list
		title: 'Recursive Dependents';
		priority: 4;
		items: [ self recursiveDependents asOrderedCollection
					sorted: [ :a :b | a displayString <= b displayString ] ];
		yourself.