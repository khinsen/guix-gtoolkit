inspecting
gtItemsFor: aView
	<gtView>
	self file isDirectory
		ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Items';
		priority: 1;
		object: [ self file ];
		view: #gtItemsFor:;
		yourself