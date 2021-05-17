inspecting
gtSourceFor: aView
	<gtView>
	^ aView forward
		title: 'Source';
		priority: 2;
		object: [ self source ];
		view: #gtItemsFor:;
		yourself