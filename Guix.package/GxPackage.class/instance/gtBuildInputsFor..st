inspecting
gtBuildInputsFor: aView
	<gtView>
	^ aView list
		title: 'Build inputs';
		priority: 8;
		items: [ self buildInputs asOrderedCollection ]