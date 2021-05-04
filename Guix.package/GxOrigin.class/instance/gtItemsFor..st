inspecting
gtItemsFor: aView
	<gtView>
	^ aView forward
		title: 'Items';
		priority: 0;
		object: [ data ];
		view: #gtItemsFor:;
		yourself