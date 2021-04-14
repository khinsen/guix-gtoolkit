inspecting
gtEnvironmentsFor: aView
	<gtView>
	^ aView list
		title: 'Environments';
		priority: 1;
		items: [ environments values ];
		itemText: #name;
		yourself