inspecting
gtSourceFor: aView
	<gtView>
	^ aView forward
		title: 'Source';
		priority: 1;
		object: [ self source ];
		view: #gtItemsFor:;
		yourself