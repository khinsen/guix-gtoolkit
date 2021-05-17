inspecting
gtInputsFor: aView
	<gtView>
	^ aView list
		title: 'Inputs';
		priority: 2.5;
		items: [ self directInputs asOrderedCollection
					sorted: [ :a :b | a displayString <= b displayString ] ]