inspecting
gtInputsFor: aView
	<gtView>
	^ aView list
		title: 'Inputs';
		priority: 7;
		items: [ self directInputs asOrderedCollection ]