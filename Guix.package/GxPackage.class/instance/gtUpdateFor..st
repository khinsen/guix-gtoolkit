inspecting
gtUpdateFor: aView
	<gtView>
	^ aView forward
		title: 'Update';
		priority: 9;
		object: [ self refresh ];
		view: #gtStringFor:;
		yourself