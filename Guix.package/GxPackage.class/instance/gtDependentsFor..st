inspecting
gtDependentsFor: aView
	<gtView>
	dependents ifEmpty: [ ^ aView empty ].
	^ aView list
		title: 'Dependents';
		priority: 2;
		items: [ self dependents asOrderedCollection
					sorted: [ :a :b | a displayString <= b displayString ] ];
		yourself.