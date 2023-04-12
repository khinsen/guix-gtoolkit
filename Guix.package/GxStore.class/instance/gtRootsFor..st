inspecting
gtRootsFor: aView
	<gtView>
	^ aView list
		title: 'Roots';
		priority: 1;
		items: [ self roots ];
		itemText: #displayString;
		yourself