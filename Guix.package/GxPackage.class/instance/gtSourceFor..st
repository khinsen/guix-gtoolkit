inspecting
gtSourceFor: aView
	<gtView>
	self source ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Source';
		priority: 2;
		object: [ self source first ];
		view: #gtItemsFor:;
		yourself