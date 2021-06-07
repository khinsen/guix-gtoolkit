inspecting
gtDependentsFor: aView
	<gtView>
	dependents ifEmpty: [ ^ aView empty ].
	^ aView list
		title: 'Dependents';
		priority: 5;
		items: [ dependents sorted: [ :a :b | a displayString <= b displayString ] ];
		yourself.