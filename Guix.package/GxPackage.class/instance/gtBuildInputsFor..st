inspecting
gtBuildInputsFor: aView
	<gtView>
	^ aView list
		title: 'Build inputs';
		priority: 3;
		items: [ self buildInputs asOrderedCollection ]