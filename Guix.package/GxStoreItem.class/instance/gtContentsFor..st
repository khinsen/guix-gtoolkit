inspecting
gtContentsFor: aView
	<gtView>
	self file isFile
		ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Contents';
		priority: 1;
		object: [ self file ];
		view: #gtContentsFor:;
		yourself